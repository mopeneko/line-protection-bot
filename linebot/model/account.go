package model

import "time"

// Account - アカウント
type Account struct {
	ID                 string     // ID
	DisplayName        string     // 名前
	Mid                string     // mid
	AccessToken        string     // アクセストークン
	IssuedAt           *time.Time // アクセストークン発行日
	AuthKey            string     // 認証キー
	LocalRevision      int64
	GlobalRevision     int64
	IndividualRevision int64
}
