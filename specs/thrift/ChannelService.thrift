enum ErrorCode {
    ILLEGAL_ARGUMENT = 0,
    INTERNAL_ERROR = 1,
    CONNECTION_ERROR = 2,
    AUTHENTICATIONI_FAILED = 3,
    NEED_PERMISSION_APPROVAL = 4,
    COIN_NOT_USABLE = 5,
    WEBVIEW_NOT_ALLOWED = 6,
}

exception ChannelException {
    1: ErrorCode code,
    2: string reason,
    3: map<string, string> parameterMap
}

struct WebLoginResponse{
    1: string returnUrl,
    2: string optionalReturnUrl,
    3: string redirectConfirmationPageUrl
}

struct WebLoginRequest {
    1: string hookedFullUrl,
    2: string sessionString,
    3: bool fromIAB,
    4: string sourceApplication,
}

struct ChannelIdWithLastUpdated {
    1: string channelId,
    2: i64 lastUpdated
}

struct ChannelSettings {
    1: bool unapprovedMessageReceivable
}


struct ChannelToken {
    1: string token,
    2: string obsToken,
    3: i64 expiration,
    4: string refreshToken,
    5: string channelAccessToken
}


struct ChannelNotificationSetting {
    1: string channelId,
    2: string name,
    3: bool notificationReceivable,
    4: bool messageReceivable,
    5: bool showDefault
}

struct ChannelDomain {
    1: string host,
    2: bool removed
}

struct ChannelDomains {
    1: list<ChannelDomain> channelDomains,
    2: i64 revision
}

struct RequestTokenResponse {
    1: string requestToken,
    2: string returnUrl
}



service ChannelService {
    WebLoginResponse getWebLoginDisallowedUrl(
        2: WebLoginRequest webLoginRequest
    ) throws (1: ChannelException e),

    list<string> getUpdatedChannelIds(
        1: list<ChannelIdWithLastUpdated> channelIds
    ) throws (1: ChannelException e),

    bool updateChannelSettings(
        1: ChannelSettings channelSettings
    ) throws (1: ChannelException e),

    WebLoginResponse getReturnUrlWithRequestTokenForAutoLogin(
        2: WebLoginRequest webLoginRequest
    ) throws (1: ChannelException e),

    ChannelToken approveChannelAndIssueChannelToken(
        1: string channelId
    ) throws (1: ChannelException e),

    void updateChannelNotificationSetting(
        1: list<ChannelNotificationSetting> setting
    ) throws (1: ChannelException e),

    ChannelDomains getCommonDomains(
        1: i64 lastSynced
    ) throws (1: ChannelException e),

    ChannelSettings getChannelSettings(
    ) throws (1: ChannelException e),

    RequestTokenResponse issueRequestTokenWithAuthScheme(
        1: string channelId,
        2: string otpId,
        3: list<string> authScheme,
        4: string returnUrl
    ) throws (1: ChannelException e),

    ChannelToken issueChannelToken(
        1: string channelId
    ) throws (1: ChannelException e),
}