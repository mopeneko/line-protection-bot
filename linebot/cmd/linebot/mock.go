package main

import (
	"context"
	"time"

	"github.com/mopeneko/line-protection-bot/linebot/model"
	"github.com/mopeneko/line-protection-bot/linebot/model/query"
)

type accountRepositoryMock struct {
	accounts []*model.Account
}

func newAccountRepositoryMock() *accountRepositoryMock {
	issuedAt := time.Now()
	return &accountRepositoryMock{
		accounts: []*model.Account{
			{
				ID:                 "AccountID1",
				DisplayName:        "Account1",
				Mid:                "mid1",
				AccessToken:        "AccessToken1",
				IssuedAt:           &issuedAt,
				AuthKey:            "AuthKey1",
				LocalRevision:      0,
				GlobalRevision:     0,
				IndividualRevision: 0,
			},
		},
	}
}

func (m *accountRepositoryMock) Upsert(_ context.Context, acct *model.Account) (*model.Account, error) {
	for i, a := range m.accounts {
		if a.ID == acct.ID {
			m.accounts[i] = acct
			return acct, nil
		}
	}
	m.accounts = append(m.accounts, acct)
	return acct, nil
}

func (m *accountRepositoryMock) Search(_ context.Context, query query.AccountQuery) ([]*model.Account, error) {
	return m.accounts, nil
}
