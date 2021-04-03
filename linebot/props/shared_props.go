package props

import "github.com/mopeneko/line-protection-bot/linebot/repository"

// SharedProps - bot全体で共有されるプロパティ
type SharedProps struct {
	AccountRepository repository.AccountRepository
}
