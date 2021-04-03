package android

import (
	"encoding/base64"
	"fmt"
	"strings"

	"github.com/mopeneko/line-protection-bot/linebot/pkg/linetoken/ywt"
	"golang.org/x/xerrors"
)

// GenerateToken - Androidのアクセストークンを生成する
func GenerateToken(authKey string) (string, error) {
	issuedAt := ywt.GenerateIssuedAt()

	token := fmt.Sprintf("iat: %d\n", issuedAt)
	encodedToken := base64.StdEncoding.EncodeToString(([]byte)(token))

	// authKeyからmidと鍵を抽出する
	splitedAuthKey := strings.Split(authKey, ":")
	mid := splitedAuthKey[0]
	key, err := base64.StdEncoding.DecodeString(splitedAuthKey[1])
	if err != nil {
		return "", xerrors.Errorf("failed to decode hmac key: %w", err)
	}

	message := encodedToken + "."

	mac := ywt.SignYWT(message, key)

	authToken := fmt.Sprintf("%s:%s.%s", mid, message, mac)
	return authToken, nil
}
