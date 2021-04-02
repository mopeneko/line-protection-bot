package lineclient

import (
	"github.com/apache/thrift/lib/go/thrift"
	"golang.org/x/xerrors"
)

// thriftClient - Thriftクライアントの必須要素を持つ構造体
type thriftClient struct {
	StandardClient *thrift.TStandardClient
	httpClient     *thrift.THttpClient
}

func newThriftClient(url string) (*thriftClient, error) {
	transport, err := thrift.NewTHttpClient(url)
	if err != nil {
		return nil, xerrors.Errorf("failed to generate HTTP client: %w", err)
	}

	protocol := thrift.NewTCompactProtocolConf(transport, &thrift.TConfiguration{})

	standardClient := thrift.NewTStandardClient(protocol, protocol)

	client := &thriftClient{
		StandardClient: standardClient,
		httpClient:     transport.(*thrift.THttpClient),
	}

	return client, nil
}
