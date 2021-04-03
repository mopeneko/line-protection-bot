package repository

import (
	"context"

	"github.com/mopeneko/line-protection-bot/linebot/model"
	"github.com/mopeneko/line-protection-bot/linebot/model/query"
)

// AccountRepository - アカウントのリポジトリ
type AccountRepository interface {
	Upsert(ctx context.Context, account *model.Account) (*model.Account, error)
	Search(ctx context.Context, query query.AccountQuery) ([]*model.Account, error)
}
