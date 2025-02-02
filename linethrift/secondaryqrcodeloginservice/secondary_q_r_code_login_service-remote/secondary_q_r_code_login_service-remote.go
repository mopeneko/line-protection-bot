// Code generated by Thrift Compiler (0.14.1). DO NOT EDIT.

package main

import (
	"context"
	"flag"
	"fmt"
	"math"
	"net"
	"net/url"
	"os"
	"strconv"
	"strings"
	"github.com/apache/thrift/lib/go/thrift"
	"secondaryqrcodeloginservice"
)

var _ = secondaryqrcodeloginservice.GoUnusedProtection__

func Usage() {
  fmt.Fprintln(os.Stderr, "Usage of ", os.Args[0], " [-h host:port] [-u url] [-f[ramed]] function [arg1 [arg2...]]:")
  flag.PrintDefaults()
  fmt.Fprintln(os.Stderr, "\nFunctions:")
  fmt.Fprintln(os.Stderr, "  CancelPinCodeResponse cancelPinCode(CancelPinCodeRequest request)")
  fmt.Fprintln(os.Stderr, "  VerifyPinCodeResponse verifyPinCode(VerifyPinCodeRequest request)")
  fmt.Fprintln(os.Stderr, "  VerifyQrCodeResponse verifyQrCode(VerifyCertificateRequest request)")
  fmt.Fprintln(os.Stderr, "  CreatePinCodeResponse createPinCode(CreatePinCodeRequest request)")
  fmt.Fprintln(os.Stderr, "  CreateQrCodeResponse createQrCode(CreateQrCodeRequest request)")
  fmt.Fprintln(os.Stderr, "  CreateQrSessionResponse createSession(CreateQrSessionRequest request)")
  fmt.Fprintln(os.Stderr, "  QrCodeLoginResponse qrCodeLogin(QrCodeLoginRequest request)")
  fmt.Fprintln(os.Stderr, "  VerifyCertificateResponse verifyCertificate(VerifyCertificateRequest request)")
  fmt.Fprintln(os.Stderr, "  CheckPinCodeVerifiedResponse checkPinCodeVerified(CheckPinCodeVerifiedRequest request)")
  fmt.Fprintln(os.Stderr, "  CheckQrCodeVerifiedResponse checkQrCodeVerified(CheckQrCodeVerifiedRequest request)")
  fmt.Fprintln(os.Stderr)
  os.Exit(0)
}

type httpHeaders map[string]string

func (h httpHeaders) String() string {
  var m map[string]string = h
  return fmt.Sprintf("%s", m)
}

func (h httpHeaders) Set(value string) error {
  parts := strings.Split(value, ": ")
  if len(parts) != 2 {
    return fmt.Errorf("header should be of format 'Key: Value'")
  }
  h[parts[0]] = parts[1]
  return nil
}

func main() {
  flag.Usage = Usage
  var host string
  var port int
  var protocol string
  var urlString string
  var framed bool
  var useHttp bool
  headers := make(httpHeaders)
  var parsedUrl *url.URL
  var trans thrift.TTransport
  _ = strconv.Atoi
  _ = math.Abs
  flag.Usage = Usage
  flag.StringVar(&host, "h", "localhost", "Specify host and port")
  flag.IntVar(&port, "p", 9090, "Specify port")
  flag.StringVar(&protocol, "P", "binary", "Specify the protocol (binary, compact, simplejson, json)")
  flag.StringVar(&urlString, "u", "", "Specify the url")
  flag.BoolVar(&framed, "framed", false, "Use framed transport")
  flag.BoolVar(&useHttp, "http", false, "Use http")
  flag.Var(headers, "H", "Headers to set on the http(s) request (e.g. -H \"Key: Value\")")
  flag.Parse()
  
  if len(urlString) > 0 {
    var err error
    parsedUrl, err = url.Parse(urlString)
    if err != nil {
      fmt.Fprintln(os.Stderr, "Error parsing URL: ", err)
      flag.Usage()
    }
    host = parsedUrl.Host
    useHttp = len(parsedUrl.Scheme) <= 0 || parsedUrl.Scheme == "http" || parsedUrl.Scheme == "https"
  } else if useHttp {
    _, err := url.Parse(fmt.Sprint("http://", host, ":", port))
    if err != nil {
      fmt.Fprintln(os.Stderr, "Error parsing URL: ", err)
      flag.Usage()
    }
  }
  
  cmd := flag.Arg(0)
  var err error
  if useHttp {
    trans, err = thrift.NewTHttpClient(parsedUrl.String())
    if len(headers) > 0 {
      httptrans := trans.(*thrift.THttpClient)
      for key, value := range headers {
        httptrans.SetHeader(key, value)
      }
    }
  } else {
    portStr := fmt.Sprint(port)
    if strings.Contains(host, ":") {
           host, portStr, err = net.SplitHostPort(host)
           if err != nil {
                   fmt.Fprintln(os.Stderr, "error with host:", err)
                   os.Exit(1)
           }
    }
    trans, err = thrift.NewTSocket(net.JoinHostPort(host, portStr))
    if err != nil {
      fmt.Fprintln(os.Stderr, "error resolving address:", err)
      os.Exit(1)
    }
    if framed {
      trans = thrift.NewTFramedTransport(trans)
    }
  }
  if err != nil {
    fmt.Fprintln(os.Stderr, "Error creating transport", err)
    os.Exit(1)
  }
  defer trans.Close()
  var protocolFactory thrift.TProtocolFactory
  switch protocol {
  case "compact":
    protocolFactory = thrift.NewTCompactProtocolFactory()
    break
  case "simplejson":
    protocolFactory = thrift.NewTSimpleJSONProtocolFactory()
    break
  case "json":
    protocolFactory = thrift.NewTJSONProtocolFactory()
    break
  case "binary", "":
    protocolFactory = thrift.NewTBinaryProtocolFactoryDefault()
    break
  default:
    fmt.Fprintln(os.Stderr, "Invalid protocol specified: ", protocol)
    Usage()
    os.Exit(1)
  }
  iprot := protocolFactory.GetProtocol(trans)
  oprot := protocolFactory.GetProtocol(trans)
  client := secondaryqrcodeloginservice.NewSecondaryQRCodeLoginServiceClient(thrift.NewTStandardClient(iprot, oprot))
  if err := trans.Open(); err != nil {
    fmt.Fprintln(os.Stderr, "Error opening socket to ", host, ":", port, " ", err)
    os.Exit(1)
  }
  
  switch cmd {
  case "cancelPinCode":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "CancelPinCode requires 1 args")
      flag.Usage()
    }
    arg35 := flag.Arg(1)
    mbTrans36 := thrift.NewTMemoryBufferLen(len(arg35))
    defer mbTrans36.Close()
    _, err37 := mbTrans36.WriteString(arg35)
    if err37 != nil {
      Usage()
      return
    }
    factory38 := thrift.NewTJSONProtocolFactory()
    jsProt39 := factory38.GetProtocol(mbTrans36)
    argvalue0 := secondaryqrcodeloginservice.NewCancelPinCodeRequest()
    err40 := argvalue0.Read(context.Background(), jsProt39)
    if err40 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.CancelPinCode(context.Background(), value0))
    fmt.Print("\n")
    break
  case "verifyPinCode":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "VerifyPinCode requires 1 args")
      flag.Usage()
    }
    arg41 := flag.Arg(1)
    mbTrans42 := thrift.NewTMemoryBufferLen(len(arg41))
    defer mbTrans42.Close()
    _, err43 := mbTrans42.WriteString(arg41)
    if err43 != nil {
      Usage()
      return
    }
    factory44 := thrift.NewTJSONProtocolFactory()
    jsProt45 := factory44.GetProtocol(mbTrans42)
    argvalue0 := secondaryqrcodeloginservice.NewVerifyPinCodeRequest()
    err46 := argvalue0.Read(context.Background(), jsProt45)
    if err46 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.VerifyPinCode(context.Background(), value0))
    fmt.Print("\n")
    break
  case "verifyQrCode":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "VerifyQrCode requires 1 args")
      flag.Usage()
    }
    arg47 := flag.Arg(1)
    mbTrans48 := thrift.NewTMemoryBufferLen(len(arg47))
    defer mbTrans48.Close()
    _, err49 := mbTrans48.WriteString(arg47)
    if err49 != nil {
      Usage()
      return
    }
    factory50 := thrift.NewTJSONProtocolFactory()
    jsProt51 := factory50.GetProtocol(mbTrans48)
    argvalue0 := secondaryqrcodeloginservice.NewVerifyCertificateRequest()
    err52 := argvalue0.Read(context.Background(), jsProt51)
    if err52 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.VerifyQrCode(context.Background(), value0))
    fmt.Print("\n")
    break
  case "createPinCode":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "CreatePinCode requires 1 args")
      flag.Usage()
    }
    arg53 := flag.Arg(1)
    mbTrans54 := thrift.NewTMemoryBufferLen(len(arg53))
    defer mbTrans54.Close()
    _, err55 := mbTrans54.WriteString(arg53)
    if err55 != nil {
      Usage()
      return
    }
    factory56 := thrift.NewTJSONProtocolFactory()
    jsProt57 := factory56.GetProtocol(mbTrans54)
    argvalue0 := secondaryqrcodeloginservice.NewCreatePinCodeRequest()
    err58 := argvalue0.Read(context.Background(), jsProt57)
    if err58 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.CreatePinCode(context.Background(), value0))
    fmt.Print("\n")
    break
  case "createQrCode":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "CreateQrCode requires 1 args")
      flag.Usage()
    }
    arg59 := flag.Arg(1)
    mbTrans60 := thrift.NewTMemoryBufferLen(len(arg59))
    defer mbTrans60.Close()
    _, err61 := mbTrans60.WriteString(arg59)
    if err61 != nil {
      Usage()
      return
    }
    factory62 := thrift.NewTJSONProtocolFactory()
    jsProt63 := factory62.GetProtocol(mbTrans60)
    argvalue0 := secondaryqrcodeloginservice.NewCreateQrCodeRequest()
    err64 := argvalue0.Read(context.Background(), jsProt63)
    if err64 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.CreateQrCode(context.Background(), value0))
    fmt.Print("\n")
    break
  case "createSession":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "CreateSession requires 1 args")
      flag.Usage()
    }
    arg65 := flag.Arg(1)
    mbTrans66 := thrift.NewTMemoryBufferLen(len(arg65))
    defer mbTrans66.Close()
    _, err67 := mbTrans66.WriteString(arg65)
    if err67 != nil {
      Usage()
      return
    }
    factory68 := thrift.NewTJSONProtocolFactory()
    jsProt69 := factory68.GetProtocol(mbTrans66)
    argvalue0 := secondaryqrcodeloginservice.NewCreateQrSessionRequest()
    err70 := argvalue0.Read(context.Background(), jsProt69)
    if err70 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.CreateSession(context.Background(), value0))
    fmt.Print("\n")
    break
  case "qrCodeLogin":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "QrCodeLogin requires 1 args")
      flag.Usage()
    }
    arg71 := flag.Arg(1)
    mbTrans72 := thrift.NewTMemoryBufferLen(len(arg71))
    defer mbTrans72.Close()
    _, err73 := mbTrans72.WriteString(arg71)
    if err73 != nil {
      Usage()
      return
    }
    factory74 := thrift.NewTJSONProtocolFactory()
    jsProt75 := factory74.GetProtocol(mbTrans72)
    argvalue0 := secondaryqrcodeloginservice.NewQrCodeLoginRequest()
    err76 := argvalue0.Read(context.Background(), jsProt75)
    if err76 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.QrCodeLogin(context.Background(), value0))
    fmt.Print("\n")
    break
  case "verifyCertificate":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "VerifyCertificate requires 1 args")
      flag.Usage()
    }
    arg77 := flag.Arg(1)
    mbTrans78 := thrift.NewTMemoryBufferLen(len(arg77))
    defer mbTrans78.Close()
    _, err79 := mbTrans78.WriteString(arg77)
    if err79 != nil {
      Usage()
      return
    }
    factory80 := thrift.NewTJSONProtocolFactory()
    jsProt81 := factory80.GetProtocol(mbTrans78)
    argvalue0 := secondaryqrcodeloginservice.NewVerifyCertificateRequest()
    err82 := argvalue0.Read(context.Background(), jsProt81)
    if err82 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.VerifyCertificate(context.Background(), value0))
    fmt.Print("\n")
    break
  case "checkPinCodeVerified":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "CheckPinCodeVerified requires 1 args")
      flag.Usage()
    }
    arg83 := flag.Arg(1)
    mbTrans84 := thrift.NewTMemoryBufferLen(len(arg83))
    defer mbTrans84.Close()
    _, err85 := mbTrans84.WriteString(arg83)
    if err85 != nil {
      Usage()
      return
    }
    factory86 := thrift.NewTJSONProtocolFactory()
    jsProt87 := factory86.GetProtocol(mbTrans84)
    argvalue0 := secondaryqrcodeloginservice.NewCheckPinCodeVerifiedRequest()
    err88 := argvalue0.Read(context.Background(), jsProt87)
    if err88 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.CheckPinCodeVerified(context.Background(), value0))
    fmt.Print("\n")
    break
  case "checkQrCodeVerified":
    if flag.NArg() - 1 != 1 {
      fmt.Fprintln(os.Stderr, "CheckQrCodeVerified requires 1 args")
      flag.Usage()
    }
    arg89 := flag.Arg(1)
    mbTrans90 := thrift.NewTMemoryBufferLen(len(arg89))
    defer mbTrans90.Close()
    _, err91 := mbTrans90.WriteString(arg89)
    if err91 != nil {
      Usage()
      return
    }
    factory92 := thrift.NewTJSONProtocolFactory()
    jsProt93 := factory92.GetProtocol(mbTrans90)
    argvalue0 := secondaryqrcodeloginservice.NewCheckQrCodeVerifiedRequest()
    err94 := argvalue0.Read(context.Background(), jsProt93)
    if err94 != nil {
      Usage()
      return
    }
    value0 := argvalue0
    fmt.Print(client.CheckQrCodeVerified(context.Background(), value0))
    fmt.Print("\n")
    break
  case "":
    Usage()
    break
  default:
    fmt.Fprintln(os.Stderr, "Invalid function ", cmd)
  }
}
