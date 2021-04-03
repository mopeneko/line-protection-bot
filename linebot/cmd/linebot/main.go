package main

import (
	"context"
	"log"
	"math"
	"strconv"
	"strings"
	"time"

	"github.com/mopeneko/line-protection-bot/linebot/model"
	"github.com/mopeneko/line-protection-bot/linebot/model/query"
	"github.com/mopeneko/line-protection-bot/linebot/pkg/config"
	"github.com/mopeneko/line-protection-bot/linebot/pkg/lineclient"
	"github.com/mopeneko/line-protection-bot/linebot/pkg/linetoken/android"
	"github.com/mopeneko/line-protection-bot/linethrift/talkservice"
	"golang.org/x/xerrors"
)

func main() {
	conf := config.NewConfig()

	// 共有プロパティの初期化
	sharedProps, err := initSharedProps()
	if err != nil {
		log.Fatalf("failed to initialize shared props: %+v\n", err)
	}

	ctx := context.Background()

	// 全取得
	accounts, err := sharedProps.AccountRepository.Search(ctx, query.AccountQuery{})
	if err != nil {
		log.Fatalf("failed to get accounts: %+v\n", err)
	}

	// アクセストークンの更新
	accounts, err = refreshAccessToken(accounts)
	if err != nil {
		log.Fatalf("failed to refresh access token: %+v\n", err)
	}

	// LINEクライアントの生成
	clients := make([]*lineclient.LINEClient, 0, len(accounts))
	for _, acct := range accounts {
		client, err := generateLINEClient(conf, acct.AccessToken)
		if err != nil {
			log.Fatalf("failed to generate LINE client: %+v\n", err)
		}

		clients = append(clients, client)
	}

	// アカウント情報を出力
	printAccountInfo(ctx, clients)

	const (
		count = 100
		sep   = "\x1e"
	)
	var (
		localRev      int64
		globalRev     int64
		individualRev int64
	)

	for {
		client := clients[0]

		log.Println("localRev:", localRev, "count:", count, "globalRev:", globalRev, "individualRev:", individualRev)
		operations, err := client.TalkServiceClientForPolling.FetchOps(ctx, localRev, count, globalRev, individualRev)
		if err != nil {
			log.Fatalf("failed to call fetchOps: %+v\n", err)
		}

		for _, op := range operations {
			if op.Type == talkservice.OpType_END_OF_OPERATION {
				if op.Param1 != "" {
					individualRevString, err := strconv.Atoi(strings.Split(op.Param1, sep)[0])
					if err != nil {
						log.Fatalf("failed to get individualRev: %+v\n", err)
					}
					individualRev = int64(individualRevString)
				}

				if op.Param2 != "" {
					globalRevString, err := strconv.Atoi(strings.Split(op.Param2, sep)[0])
					if err != nil {
						log.Fatalf("failed to get individualRev: %+v\n", err)
					}
					globalRev = int64(globalRevString)
				}

				continue
			}

			localRev = int64(math.Max(float64(localRev), float64(op.Revision)))

			log.Printf("%+v\n", op)
		}
	}
}

func refreshAccessToken(accounts []*model.Account) ([]*model.Account, error) {
	a := accounts

	for _, acct := range a {
		now := time.Now()
		if acct.IssuedAt == nil || now.After(acct.IssuedAt.Add(time.Hour*24*30)) {
			token, err := android.GenerateToken(acct.AuthKey)
			if err != nil {
				return nil, xerrors.Errorf("failed to generate access token: %w", err)
			}

			acct.AccessToken = token
			acct.IssuedAt = &now
		}
	}

	return a, nil
}

func generateLINEClient(conf *config.Config, accessToken string) (*lineclient.LINEClient, error) {
	cfg := &lineclient.Config{
		Host:                      conf.Host,
		TalkServicePath:           conf.TalkServicePath,
		TalkServicePathForPolling: conf.TalkServicePathForPolling,
		UserAgent:                 conf.UserAgent,
		LINEApp:                   conf.LINEApp,
		AccessToken:               accessToken,
	}

	client, err := lineclient.NewLINEClient(cfg)
	if err != nil {
		return nil, xerrors.Errorf("failed to generate LINE client: %w", err)
	}

	return client, nil
}

func printAccountInfo(ctx context.Context, clients []*lineclient.LINEClient) {
	log.Println("===== LINE Accounts =====")
	for i, client := range clients {
		profile, err := client.TalkServiceClient.GetProfile(ctx, talkservice.SyncReason_INITIALIZATION)
		if err != nil {
			log.Fatalf("failed to call getProfile: %+v\n", err)
		}

		ticket, err := client.TalkServiceClient.GenerateUserTicket(ctx, math.MaxInt64, math.MaxInt32)
		if err != nil {
			log.Fatalf("failed to call generateUserTicket: %+v\n", err)
		}
		log.Printf("[%d] %s https://line.me/ti/p/%s\n", i, profile.DisplayName, ticket.ID)
	}
}
