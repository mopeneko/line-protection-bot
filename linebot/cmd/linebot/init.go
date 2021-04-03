package main

import "github.com/mopeneko/line-protection-bot/linebot/props"

func initSharedProps() (*props.SharedProps, error) {
	p := &props.SharedProps{
		AccountRepository: newAccountRepositoryMock(),
	}
	return p, nil
}
