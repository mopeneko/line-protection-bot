package config

// Config - LINE botの設定
type Config struct {
	Host                      string // LINEのホスト(スキームも含む)
	TalkServicePath           string // TalkServiceのパス
	TalkServicePathForPolling string // TalkServiceのパス(Polling用)
	UserAgent                 string // User-Agentヘッダ
	LINEApp                   string // X-Line-Applicationヘッダ
}

// NewConfig - Configのコンストラクタ
func NewConfig() *Config {
	return &Config{
		Host:                      "https://legy-jp.line.naver.jp",
		TalkServicePath:           "/S4",
		TalkServicePathForPolling: "/P4",
		UserAgent:                 "Line/11.5.1",
		LINEApp:                   "ANDROID\t11.5.1\tAndroid OS\t10",
	}
}
