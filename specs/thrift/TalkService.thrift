
enum Method_ {
    TIMELINE = 1;
    NEARBY = 2;
    SQUARE = 3;
}

enum ErrorCode {
    ILLEGAL_ARGUMENT = 0;
    AUTHENTICATION_FAILED = 1;
    DB_FAILED = 2;
    INVALID_STATE = 3;
    EXCESSIVE_ACCESS = 4;
    NOT_FOUND = 5;
    INVALID_MID = 9;
    NOT_A_MEMBER = 10;
    INVALID_LENGTH = 6;
    NOT_AVAILABLE_USER = 7;
    NOT_AUTHORIZED_DEVICE = 8;
    NOT_AUTHORIZED_SESSION = 14;
    INCOMPATIBLE_APP_VERSION = 11;
    NOT_READY = 12;
    NOT_AVAILABLE_SESSION = 13;
    SYSTEM_ERROR = 15;
    NO_AVAILABLE_VERIFICATION_METHOD = 16;
    NOT_AUTHENTICATED = 17;
    INVALID_IDENTITY_CREDENTIAL = 18;
    NOT_AVAILABLE_IDENTITY_IDENTIFIER = 19;
    INTERNAL_ERROR = 20;
    NO_SUCH_IDENTITY_IDENFIER = 21;
    DEACTIVATED_ACCOUNT_BOUND_TO_THIS_IDENTITY = 22;
    ILLEGAL_IDENTITY_CREDENTIAL = 23;
    UNKNOWN_CHANNEL = 24;
    NO_SUCH_MESSAGE_BOX = 25;
    NOT_AVAILABLE_MESSAGE_BOX = 26;
    CHANNEL_DOES_NOT_MATCH = 27;
    NOT_YOUR_MESSAGE = 28;
    MESSAGE_DEFINED_ERROR = 29;
    USER_CANNOT_ACCEPT_PRESENTS = 30;
    USER_NOT_STICKER_OWNER = 32;
    MAINTENANCE_ERROR = 33;
    ACCOUNT_NOT_MATCHED = 34;
    ABUSE_BLOCK = 35;
    NOT_FRIEND = 36;
    NOT_ALLOWED_CALL = 37;
    BLOCK_FRIEND = 38;
    INCOMPATIBLE_VOIP_VERSION = 39;
    INVALID_SNS_ACCESS_TOKEN = 40;
    EXTERNAL_SERVICE_NOT_AVAILABLE = 41;
    NOT_ALLOWED_ADD_CONTACT = 42;
    NOT_CERTIFICATED = 43;
    NOT_ALLOWED_SECONDARY_DEVICE = 44;
    INVALID_PIN_CODE = 45;
    NOT_FOUND_IDENTITY_CREDENTIAL = 46;
    EXCEED_FILE_MAX_SIZE = 47;
    EXCEED_DAILY_QUOTA = 48;
    NOT_SUPPORT_SEND_FILE = 49;
    MUST_UPGRADE = 50;
    NOT_AVAILABLE_PIN_CODE_SESSION = 51;
    EXPIRED_REVISION = 52;
    NOT_YET_PHONE_NUMBER = 54;
    BAD_CALL_NUMBER = 55;
    UNAVAILABLE_CALL_NUMBER = 56;
    NOT_SUPPORT_CALL_SERVICE = 57;
    CONGESTION_CONTROL = 58;
    NO_BALANCE = 59;
    NOT_PERMITTED_CALLER_ID = 60;
    NO_CALLER_ID_LIMIT_EXCEEDED = 61;
    CALLER_ID_VERIFICATION_REQUIRED = 62;
    NO_CALLER_ID_LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 63;
    MESSAGE_NOT_FOUND = 64;
    INVALID_ACCOUNT_MIGRATION_PINCODE_FORMAT = 65;
    ACCOUNT_MIGRATION_PINCODE_NOT_MATCHED = 66;
    ACCOUNT_MIGRATION_PINCODE_BLOCKED = 67;
    INVALID_PASSWORD_FORMAT = 69;
    FEATURE_RESTRICTED = 70;
    MESSAGE_NOT_DESTRUCTIBLE = 71;
    PAID_CALL_REDEEM_FAILED = 72;
    PREVENTED_JOIN_BY_TICKET = 73;
    SEND_MESSAGE_NOT_PERMITTED__fromLINE_AT = 75;
    SEND_MESSAGE_NOT_PERMITTED_WHILE_AUTO_REPLY = 76;
    SECURITY_CENTER_NOT_VERIFIED = 77;
    SECURITY_CENTER_BLOCKED_BY_SETTING = 78;
    SECURITY_CENTER_BLOCKED = 79;
    TALK_PROXY_EXCEPTION = 80;
    E2EE_INVALID_PROTOCOL = 81;
    E2EE_RETRY_ENCRYPT = 82;
    E2EE_UPDATE_SENDER_KEY = 83;
    E2EE_UPDATE_RECEIVER_KEY = 84;
    E2EE_INVALID_ARGUMENT = 85;
    E2EE_INVALID_VERSION = 86;
    E2EE_SENDER_DISABLED = 87;
    E2EE_RECEIVER_DISABLED = 88;
    E2EE_SENDER_NOT_ALLOWED = 89;
    E2EE_RECEIVER_NOT_ALLOWED = 90;
    E2EE_RESEND_FAIL = 91;
    E2EE_RESEND_OK = 92;
    HITOKOTO_BACKUP_NO_AVAILABLE_DATA = 93;
    E2EE_UPDATE_PRIMARY_DEVICE = 94;
    SUCCESS = 95;
    CANCEL = 96;
    E2EE_PRIMARY_NOT_SUPPORT = 97;
    E2EE_RETRY_PLAIN = 98;
    E2EE_RECREATE_GROUP_KEY = 99;
    E2EE_GROUP_TOO_MANY_MEMBERS = 100;
    SERVER_BUSY = 101;
    NOT_ALLOWED_ADD_FOLLOW = 102;
    INCOMING_FRIEND_REQUEST_LIMIT = 103;
    OUTGOING_FRIEND_REQUEST_LIMIT = 104;
    OUTGOING_FRIEND_REQUEST_QUOTA = 105;
    DUPLICATED = 106;
    BANNED = 107;
    NOT_AN_INVITEE = 108;
    NOT_AN_OUTSIDER = 109;
    EMPTY_GROUP = 111;
    EXCEED_FOLLOW_LIMIT = 112;
    UNSUPPORTED_ACCOUNT_TYPE = 113;
}


exception TalkException {
    1: ErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}
enum UpdateExtendedProfileAttributeAttr {
    BIRTHDAY = 0;
}
enum PrivacyLevelType  {
    PUBLIC = 0;
    PRIVATE = 1;
}
struct ExtendedProfileBirthday {
    1: string year;
    2: PrivacyLevelType yearPrivacyLevelType;
    3: bool yearEnabled;
    5: string day;
    6: PrivacyLevelType dayPrivacyLevelType;
    7: bool dayEnabled;
}

struct ExtendedProfile {
    1: ExtendedProfileBirthday birthday;
}

struct GeolocationAccurac {
    1: double radiusMeters;
    2: double radiusConfidence;
}

struct GeolocationAccuracy {
    1: double radiusMeters;
    2: double radiusConfidence;
}

struct Geolocation {
    1: double longitude;
    2: double latitude;
    3: GeolocationAccuracy accuracy;
}

enum Trigger {
    UNKNOWN = 0;
    APP_FOREGROUND = 1;
}
enum NetworkType {
    UNKNOWN = 0;
    WIFI = 1;
    CELLULAR_NETWORK = 2;
}

struct ClientNetworkStatus {
    1: NetworkType networkType
}

enum ProductType {
    COIN = 0;
    CREDIT = 1;
    MONTHLY = 2;
}

struct PaidCallBalance {
    1: ProductType productType;
    2: string productName;
    3: string unit;
    4: i32 limitedPaidBalance;
    5: i32 limitedFreeBalance;
    6: i32 unlimitedPaidBalance;
    7: i32 unlimitedFreeBalance;
    8: i64 startTime;
    9: i64 endTime;
    10: bool autopayEnabled;
}

enum ChatType {
    GROUP = 0;
    ROOM = 1;
    PEER = 2;
}


struct GroupExtra {
    1: string creator
    2: bool preventedJoinByTicket
    3: string invitationTicket
    4: map<string, i64> memberMids
    5: map<string, i64> inviteeMids
}
struct PeerExtra {}

struct Extra {
    1: GroupExtra groupExtra
    2: PeerExtra peerExtra
}
struct CreateChatRequest {
    1: i32 reqSeq;
    2: ChatType type;
    3: string name;
    4: set<string> targetUserMids;
    5: string picturePath;
}

struct Chat {
    1: ChatType type
    2: string chatMid
    3: i64 createdTime
    4: bool notificationDisabled
    5: i64 favoriteTimestamp
    6: string chatName
    7: string picturePath
    8: Extra extra
}

struct CreateChatResponse {
    1: Chat chat;
}

enum MIDType  {
    MID = 0;
    PHONE = 1;
    EMAIL = 2;
    USERID = 3;
    PROXIMITY = 4;
    GROUP = 5;
    USER = 6;
    QRCODE = 7;
    PROMOTION_BOT = 8;
    CONTACT_MESSAGE = 9;
    FRIEND_REQUEST = 10;
    REPAIR = 128;
    FACEBOOK = 2305;
    SINA = 2306;
    RENREN = 2307;
    FEIXIN = 2308;
    BBM = 2309;
    BEACON = 11;
}

struct AvatarProfile {
    1: string version
    2: i64 updatedMillis
    3: string thumbnail
}


enum ContactStatus {
    UNSPECIFIED = 0;
    FRIEND = 1;
    FRIEND_BLOCKED = 2;
    RECOMMEND = 3;
    RECOMMEND_BLOCKED = 4;
    DELETED = 5;
    DELETED_BLOCKED = 6;
}
enum ContactRelation {
    ONEWAY = 0;
    BOTH = 1;
    NOT_REGISTERED = 2;
}
enum FriendRequestStatus {
    NONE = 0;
    AVAILABLE = 1;
    ALREADY_REQUESTED = 2;
    UNAVAILABLE = 3;
}
struct Contact {
    1: string mid
    2: i64 createdTime
    10: MIDType type
    11: ContactStatus status
    21: ContactRelation relation
    22: string displayName
    23: string phoneticName
    24: string pictureStatus
    25: string thumbnailUrl
    26: string statusMessage
    27: string displayNameOverridden
    28: i64 favoriteTime
    31: bool capableVoiceCall
    32: bool capableVideoCall
    33: bool capableMyhome
    34: bool capableBuddy
    35: i32 attributes
    36: i64 settings
    37: string picturePath
    38: string recommendParams
    39: FriendRequestStatus friendRequestStatus
    40: string musicProfile
    42: string svideoProfile
    43: map<string, string> statusMessageContentMetadata
    44: AvatarProfile avatarProfile
}



struct Ticket {
    1: string id;
    2: i64 expirationTime;
    3: i32 maxUseCount;
}



struct FollowMid {
    1: string mid;
    2: string eMid;
}

struct GetFollowersRequest {
    1: FollowMid followMid;
    2: string cursor;
}

struct FollowBuddyDetail {
    1: i32 iconType;
}

struct FollowProfile {
    1: FollowMid followMid;
    2: string displayName;
    3: string picturePath;
    4: bool following;
    5: bool allowFollow;
    6: FollowBuddyDetail followBuddyDetail;
}

struct GetFollowersResponse {
    1: list<FollowProfile> profiles;
    2: string cursor;
    3: i64 followingCount;
    4: i64 followerCount;
}
struct E2EEPublicKey {
    1: i32 version;
    2: i32 keyId;
    4: binary keyData;
    5: i64 createdTime;
}

enum Provider{
    UNKNOWN = 0;
    LINE = 1;
    NAVER_KR = 2;
    LINE_PHONE = 3;
}
struct IdentifierConfirmationRequest {
    1: map<string, string> metaData;
    2: bool forceRegistration;
    3: string verificationCode;
}

struct IdentityCredentialRequest {
    1: map<string, string> metaData;
    2: Provider identityProvider;
    3: string cipherKeyId;
    4: string cipherText;
    5: IdentifierConfirmationRequest confirmationRequest;
}
enum ResponseType {
    UNKNOWN  = 0;
    SUCCESS  = 1;
    REQUIRE_SERVER_SIDE_EMAIL  = 2;
    REQUIRE_CLIENT_SIDE_EMAIL  = 3;
}

struct IdentityCredentialResponse {
    1: map<string, string> metaData;
    2: ResponseType responseType;
    3: string confirmationVerifier;
    4: i64 timeoutInSeconds;
}

struct IdentityCredential {
    1: Provider provider,
    2: string identifier,
    3: string password;
}
enum SnSIdTyoe {
    FACEBOOK = 1;
    SINA = 2;
    RENREN = 3;
    FEIXIN = 4;
    BBM = 5;
    APPLE = 6;
}
enum AccountMigrationCheckType {
    SKIP = 0;
    PINCODE = 1;
    SECURITY_CENTER = 2;
}
struct UserAuthStatus {
    1: bool phoneNumberRegistered;
    2: list<SnSIdTyoe> registeredSnsIdTypes;
    3: AccountMigrationCheckType accountMigrationCheckType;
}

enum DataTypes {
    UNKNOWN = 0;
    LOCATION = 1;
}

struct GetBuddyStatusBarV2Request {
    1: string botMid;
    2: i64 revision;
}
enum DisplayType  {
    NOT_A_FRIEND = 0;
    ALWAYS = 1;
}
struct BuddyStatusBar {
    1: string label;
    2: DisplayType displayType;
    3: string title;
    4: string iconUrl;
    5: string linkUrl;
}

enum HistorysType {
    OUT = 0;
    IN = 1;
    TOLLFREE = 2;
    RECORD = 3;
    AD = 4;
    CS = 5;
    OA = 6;
}
struct Historys {
    1: i64 seq;
    2: HistorysType type;
    3: string dialedNumber;
    4: string calledNumber;
    5: string toMid;
    6: string toName;
    7: i64 setupTime;
    8: i64 startTime;
    9: i64 endTime;
    10: i64 duration;
    11: i32 terminate;
    12: ProductType productType;
    13: i32 charge;
    14: string unit;
    15: string result;
}

struct PaidCallHistoryResult {
    1: list<Historys> historys;
    2: bool hasNext;
}

struct GroupPreference {
    11: string invitationTicket;
    12: i64 favoriteTimestamp;
}

struct Group {
    1: string id;
    2: i64 createdTime;
    10: string name;
    11: string pictureStatus;
    12: bool preventedJoinByTicket;
    13: GroupPreference groupPreference;
    20: list<Contact> members;
    21: Contact creator;
    22: list<Contact> invitee;
    31: bool notificationDisabled;
    32: string picturePath;
    40: list<string> memberMids;
    41: list<string> inviteeMids;
}
enum SyncReason {
    UNSPECIFIED = 0;
    UNKNOWN = 1;
    INITIALIZATION = 2;
    OPERATION = 3;
    FULL_SYNC = 4;
    AUTO_REPAIR = 5;
    MANUAL_REPAIR = 6;
    INTERNAL = 7;
}
enum CountryGroup {
    UNKNOWN = 0;
    EUROPEAN_ECONOMIC_AREA = 1;
}
enum ChatRoomAnnouncementType {
    MESSAGE = 0;
    NOTE = 1;
    CHANNEL = 2;
}
struct ChatRoomAnnouncementContentMetadata {
    1: string replace;
    2: string sticonOwnership;
}
enum DeletePermission {
    ANYONE_IN_CHAT = 0;
    CREATOR_ONLY = 1;
    NO_ONE = 2;
}

struct ChatRoomAnnouncementContents {
    1: i32 displayFields;
    2: string text;
    3: string link;
    4: string thumbnail;
    5: ChatRoomAnnouncementContentMetadata contentMetadata;
}

struct ChatRoomAnnouncement {
    1: i64 announcementSeq;
    2: ChatRoomAnnouncementType type;
    3: ChatRoomAnnouncementContents contents;
    4: string creatorMid;
    5: i64 createdTime;
    6: DeletePermission deletePermission;
}
struct GetFollowingsRequest {
    1: FollowMid followMid;
    2: string cursor;
}

struct GetFollowingsResponse {
    1: list<FollowProfile> profiles;
    2: string cursor;
    3: i64 followingCount;
    4: i64 followerCount;
}
struct RegisterWithPhoneNumberResult {
    1: string authToken,
    2: bool recommendEmailRegistration,
    3: string certificate,
}

enum ReportCategory {
    PROFILE = 0;
    SETTINGS = 1;
    OPS = 2;
    CONTACT = 3;
    RECOMMEND = 4;
    BLOCK = 5;
    GROUP = 6;
    ROOM = 7;
    NOTIFICATION = 8;
    ADDRESS_BOOK = 9;
}
enum RequestsSource {
    NA = 0;
    FRIEND_VIEW = 1;
    OFFICIAL_ACCOUNT_VIEW = 2;
}
enum BotType {
    RESERVED = 0;
    OFFICIAL = 1;
    LINE_AT_0 = 2;
    LINE_AT = 3;
}
struct BuddySearchResult {
    1: string mid;
    2: string displayName;
    3: string pictureStatus;
    4: string picturePath;
    5: string statusMessage;
    6: bool businessAccount;
    7: i32 iconType;
    8: BotType botType;
}

struct PaidCallCurrencyExchangeRate {
    1: string currencyCode;
    2: string currencyName;
    3: string currencySign;
    4: bool preferred;
    5: string coinRate;
    6: string creditRate;
}
struct PaidCallAdCountry {
    1: string countryCode;
    2: string rateDivision;
}

struct PaidCallMetadataResult {
    1: list<PaidCallCurrencyExchangeRate> currencyExchangeRates;
    2: list<string> recommendedCountryCodes;
    3: list<PaidCallAdCountry> adCountries;
    4: list<string> supportedCalledCountryCodes;
}

struct GetAllChatMidsRequest {
    1: bool withMemberChats;
    2: bool withInvitedChats;
}

struct GetAllChatMidsResponse {
    1: set<string> memberMids;
    2: set<string> inviteeMids;
}
enum Direction {
    INCOMING = 1;
    OUTGOING = 2;
}

struct FriendRequest {
    1: string eMid;
    2: string mid;
    3: Direction direction;
    4: Method_ method;
    5: string param;
    6: i64 createdTime;
    7: i64 seqId;
    10: string displayName;
    11: string picturePath;
    12: string pictureStatus;
}
struct Ringtone {
    1: string title;
    2: string artist;
    3: string oid;
    4: string channelId;
}
enum ApplicationType {
    IOS = 16;
    IOS_RC = 17;
    IOS_BETA = 18;
    IOS_ALPHA = 19;
    ANDROID = 32;
    ANDROID_RC = 33;
    ANDROID_BETA = 34;
    ANDROID_ALPHA = 35;
    WAP = 48;
    WAP_RC = 49;
    WAP_BETA = 50;
    WAP_ALPHA = 51;
    BOT = 64;
    BOT_RC = 65;
    BOT_BETA = 66;
    BOT_ALPHA = 67;
    WEB = 80;
    WEB_RC = 81;
    WEB_BETA = 82;
    WEB_ALPHA = 83;
    DESKTOPWIN = 96;
    DESKTOPWIN_RC = 97;
    DESKTOPWIN_BETA = 98;
    DESKTOPWIN_ALPHA = 99;
    DESKTOPMAC = 112;
    DESKTOPMAC_RC = 113;
    DESKTOPMAC_BETA = 114;
    DESKTOPMAC_ALPHA = 115;
    CHANNELGW = 128;
    CHANNELGW_RC = 129;
    CHANNELGW_BETA = 130;
    CHANNELGW_ALPHA = 213;
    CHANNELCP = 144;
    CHANNELCP_RC = 145;
    CHANNELCP_BETA = 146;
    CHANNELCP_ALPHA = 147;
    WINPHONE = 160;
    WINPHONE_RC = 161;
    WINPHONE_BETA = 162;
    WINPHONE_ALPHA = 163;
    BLACKBERRY = 176;
    BLACKBERRY_RC = 177;
    BLACKBERRY_BETA = 178;
    BLACKBERRY_ALPHA = 179;
    WINMETRO = 192;
    WINMETRO_RC = 193;
    WINMETRO_BETA = 194;
    WINMETRO_ALPHA = 195;
    S40 = 208;
    S40_RC = 209;
    S40_BETA = 210;
    S40_ALPHA = 211;
    CHRONO = 224;
    CHRONO_RC = 225;
    CHRONO_BETA = 226;
    CHRONO_ALPHA = 227;
    TIZEN = 256;
    TIZEN_RC = 257;
    TIZEN_BETA = 258;
    TIZEN_ALPHA = 259;
    VIRTUAL = 272;
    FIREFOXOS = 288;
    FIREFOXOS_RC = 289;
    FIREFOXOS_BETA = 290;
    FIREFOXOS_ALPHA = 291;
    IOSIPAD = 304;
    IOSIPAD_RC = 305;
    IOSIPAD_BETA = 306;
    IOSIPAD_ALPHA = 307;
    BIZIOS = 320;
    BIZIOS_RC = 321;
    BIZIOS_BETA = 322;
    BIZIOS_ALPHA = 323;
    BIZANDROID = 336;
    BIZANDROID_RC = 337;
    BIZANDROID_BETA = 338;
    BIZANDROID_ALPHA = 339;
    BIZBOT = 352;
    BIZBOT_RC = 353;
    BIZBOT_BETA = 354;
    BIZBOT_ALPHA = 355;
    CHROMEOS = 368;
    CHROMEOS_RC = 369;
    CHROMEOS_BETA = 370;
    CHROMEOS_ALPHA = 371;
    ANDROIDLITE = 384;
    ANDROIDLITE_RC = 385;
    ANDROIDLITE_BETA = 386;
    ANDROIDLITE_ALPHA = 387;
    WIN10 = 400;
    WIN10_RC = 401;
    WIN10_BETA = 402;
    WIN10_ALPHA = 403;
    BIZWEB = 416;
    BIZWEB_RC = 417;
    BIZWEB_BETA = 418;
    BIZWEB_ALPHA = 419;
    DUMMYPRIMARY = 432;
    DUMMYPRIMARY_RC = 433;
    DUMMYPRIMARY_BETA = 434;
    DUMMYPRIMARY_ALPHA = 435;
    SQUARE = 448;
    SQUARE_RC = 449;
    SQUARE_BETA = 450;
    SQUARE_ALPHA = 451;
    INTERNAL = 464;
    INTERNAL_RC = 465;
    INTERNAL_BETA = 466;
    INTERNAL_ALPHA = 467;
    CLOVAFRIENDS = 480;
    CLOVAFRIENDS_RC = 481;
    CLOVAFRIENDS_BETA = 482;
    CLOVAFRIENDS_ALPHA = 483;
    WATCHOS = 496;
    WATCHOS_RC = 497;
    WATCHOS_BETA = 498;
    WATCHOS_ALPHA = 499;
}

enum CarrierCode {
    NOT_SPECIFIED = 0;
    JP_DOCOMO = 1;
    JP_AU = 2;
    JP_SOFTBANK = 3;
    KR_SKT = 17;
    KR_KT = 18;
    KR_LGT = 19;
    JP_DOCOMO_LINE =4;
    JP_SOFTBANK_LINE =5;
    JP_AU_LINE =6;
}
struct DeviceInfo {
    20: ApplicationType applicationType;
    1: string deviceName;
    2: string systemName;
    3: string systemVersion;
    4: string model;
    10: CarrierCode carrierCode;
    11: string carrierName;
    5: string webViewVersion;
}

struct RemoveFollowerRequest {
    1: FollowMid followMid;
}

struct UnfollowRequest {
    1: FollowMid followMid;
}
enum MediaType {
    AUDIO = 1;
    VIDEO = 2;
    LIVE = 3;
}
struct CancelChatInvitationResponse {}

struct FindChatByTicketRequest {
    1: string ticketId;
}

struct FindChatByTicketResponse {
    1: Chat chat
}

struct ChatRoomBGM {
    1: string creatorMid;
    2: i64 createdTime;
    3: string chatRoomBGMInfo;
}
enum ContentType  {
    NONE = 0;
    IMAGE = 1;
    VIDEO = 2;
    AUDIO = 3;
    HTML = 4;
    PDF = 5;
    CALL = 6;
    STICKER = 7;
    PRESENCE = 8;
    GIFT = 9;
    GROUPBOARD = 10;
    APPLINK = 11;
    LINK = 12;
    CONTACT = 13;
    FILE = 14;
    LOCATION = 15;
    POSTNOTIFICATION = 16;
    RICH = 17;
    CHATEVENT = 18;
    MUSIC = 19;
    PAYMENT = 20;
    EXTIMAGE = 21;
    FLEX = 22;
}
struct E2EEGroupSharedKey {
    1: i32 keyVersion;
    2: i32 groupKeyId;
    3: string creator;
    4: i32 creatorKeyId;
    5: string receiver;
    6: i32 receiverKeyId;
    7: binary encryptedSharedKey;
    8: set<ContentType> allowedTypes;
    9: i32 specVersion;
}

struct Profile {
    1: string mid;
    3: string userid;
    10: string phone;
    11: string email;
    12: string regionCode;
    20: string displayName;
    21: string phoneticName;
    22: string pictureStatus;
    23: string thumbnailUrl;
    24: string statusMessage;
    31: bool allowSearchByUserid;
    32: bool allowSearchByEmail;
    33: string picturePath;
    34: string musicProfile;
    35: string videoProfile;
    36: map<string, string> statusMessageContentMetadata;
    37: AvatarProfile avatarProfile;
}

struct RegisterWithSnsIdResult {
    1: string authToken;
    2: bool userCreated;
    3: bool recommendEmailRegistration;
}
struct AuthSessionRequest {
    1: map<string, string> metaData;
}
struct Balance {
    1: string currentPointsFixedPointDecimal;
}

struct GetBalanceResponse {
    1: Balance balance;
}
struct GetBalanceRequest {}
enum updateNotificationType {
    APPLE_APNS = 1;
    GOOGLE_C2DM = 2;
    NHN_NNI = 3;
    SKT_AOM = 4;
    MS_MPNS = 5;
    RIM_BIS = 6;
    GOOGLE_GCM = 7;
    NOKIA_NNAPI = 8;
    TIZEN = 9;
    MOZILLA_SIMPLE = 10;
    LINE_BOT = 17;
    LINE_WAP = 18;
    APPLE_APNS_VOIP = 19;
    MS_WNS = 20;
    GOOGLE_FCM = 21;
    CLOVA = 22;
    CLOVA_VOIP = 23;
    HUAWEI_HCM = 24;
}

enum VerificationResult {
    FAILED = 0;
    OK_NOT_REGISTERED_YET = 1;
    OK_REGISTERED_WITH_SAME_DEVICE = 2;
    OK_REGISTERED_WITH_ANOTHER_DEVICE = 3;
}

struct PhoneVerificationResult {
    1: VerificationResult verificationResult;
    2: AccountMigrationCheckType accountMigrationCheckType;
    3: bool recommendAddFriends;
}

struct Room {
    1: string mid;
    2: i64 createdTime;
    10: list<Contact> contents;
    31: bool notificationDisabled;
    40: list<string> memberMids;
}

struct GetChatsResponse {
    1: list<Chat> chats
}

struct GetChatsRequest {
    1: list<string> chatMid;
    2: bool withMembers;
    3: bool withInvitees;
}
struct ReissueChatTicketRequest {
    1: i32 reqSeq;
    2: string groupMid;
}

struct ReissueChatTicketResponse {
    1: string ticketId;
}
enum ToType  {
    USER = 0;
    ROOM = 1;
    GROUP = 2;
    SQUARE = 3;
    SQUARE_CHAT = 4;
    SQUARE_MEMBER = 5;
    BOT = 6;
}
enum LocationProvider {
    GOOGLE = 0;
    BAIDU = 1;
    FOURSQUARE = 2;
}

struct Location {
    1: string title;
    2: string address;
    3: double latitude;
    4: double longitude;
    5: string phone;
    6: string categoryId;
    7: LocationProvider provider;
    8: GeolocationAccuracy accuracy;
}
enum MessageRelationType  {
    FORWARD = 0;
    AUTO_REPLY = 1;
    SUBORDINATE = 2;
    REPLY = 3;
}
enum RelatedMessageServiceCode {
    UNKNOWN = 0;
    TALK = 1;
    SQUARE = 2;
}

enum AppExtensionType {
    SIRI = 1;
    GOOGLE_ASSISTANT = 2;
}
struct Message {
    1: string from_;
    2: string to;
    3: optional ToType toType;
    4: string id;
    5: i64 createdTime;
    6: i64 deliveredTime;
    10: string text;
    11: optional Location location;
    14: bool hasContent;
    15: ContentType contentType;
    18: map<string, string> contentMetadata;
    17: binary contentPreview;
    19: binary sessionId;
    20: list<binary> chunks;
    21: optional string relatedMessageId;
    22: MessageRelationType messageRelationType;
    23: i32 readCount;
    24: RelatedMessageServiceCode relatedMessageServiceCode;
    25: AppExtensionType appExtensionType;
}

struct CallHost {
    1: string host;
    2: i32 port;
    3: string zone;
}
enum ProtoCall {
    STANDARD = 1;
    CONSTELLA = 2;
}
struct GroupCallRoute {
    1: string token;
    2: CallHost cscf;
    3: CallHost mix;
    4: string hostMid;
    5: list<string> capabilities;
    6: ProtoCall proto;
    7: string voipAddress;
    8: i32 voipUdpPort;
    9: i32 voipTcpPort;
    10: string fromZone;
    11: string commParam;
    12: string polarisAddress;
    13: i32 polarisUdpPort;
    14: string polarisZone;
    15: string orionAddress;
}

struct AcceptChatInvitationByTicketResponse {}

struct AcceptChatInvitationByTicketRequest {
    1: i32 reqSeq;
    2: string chatMid;
    3: string ticketId;
}
enum Attr  {
    ALL  = 511;
    EMAIL = 1;
    DISPLAY_NAME = 2;
    PHONETIC_NAME = 4;
    PICTURE = 8;
    STATUS_MESSAGE = 16;
    ALLOW_SEARCH_BY_USERID = 32;
    ALLOW_SEARCH_BY_EMAIL = 64;
    BUDDY_STATUS = 128;
    MUSIC_PROFILE = 256;
    AVATAR_PROFILE = 512;
}

struct ProfileContent {
    1: string value;
    2: map<string, string> meta;
}



struct UpdateProfileAttributesRequest {
    1: map<Attr, ProfileContent> profileAttributes;
}
struct AcceptChatInvitationResponse {}


struct AcceptChatInvitationRequest {
    1: i32 reqSeq;
    2: string chatMid;
}
struct InviteIntoChatResponse {}
struct InviteIntoChatRequest {
    1: i32 reqSeq;
    2: string chatMid;
    3: set<string> targetUserMids;
}

struct FollowRequest {
    1: FollowMid followMid
}

enum FeatureType {
    OBS_VIDEO = 1;
    OBS_GENERAL = 2;
    OBS_RINGBACK_TONE = 3;
}

enum OpType  {
    END_OF_OPERATION = 0;
    UPDATE_PROFILE = 1;
    UPDATE_SETTINGS = 36;
    NOTIFIED_UPDATE_PROFILE = 2;
    REGISTER_USERID = 3;
    ADD_CONTACT = 4;
    NOTIFIED_ADD_CONTACT = 5;
    BLOCK_CONTACT = 6;
    UNBLOCK_CONTACT = 7;
    NOTIFIED_RECOMMEND_CONTACT = 8;
    CREATE_GROUP = 9;
    UPDATE_GROUP = 10;
    NOTIFIED_UPDATE_GROUP = 11;
    INVITE_INTO_GROUP = 12;
    NOTIFIED_INVITE_INTO_GROUP = 13;
    CANCEL_INVITATION_GROUP = 31;
    NOTIFIED_CANCEL_INVITATION_GROUP = 32;
    LEAVE_GROUP = 14;
    NOTIFIED_LEAVE_GROUP = 15;
    ACCEPT_GROUP_INVITATION = 16;
    NOTIFIED_ACCEPT_GROUP_INVITATION = 17;
    REJECT_GROUP_INVITATION = 34;
    NOTIFIED_REJECT_GROUP_INVITATION = 35;
    KICKOUT__fromGROUP = 18;
    NOTIFIED_KICKOUT__fromGROUP = 19;
    CREATE_ROOM = 20;
    INVITE_INTO_ROOM = 21;
    NOTIFIED_INVITE_INTO_ROOM = 22;
    LEAVE_ROOM = 23;
    NOTIFIED_LEAVE_ROOM = 24;
    SEND_MESSAGE = 25;
    RECEIVE_MESSAGE = 26;
    SEND_MESSAGE_RECEIPT = 27;
    RECEIVE_MESSAGE_RECEIPT = 28;
    SEND_CONTENT_RECEIPT = 29;
    SEND_CHAT_CHECKED = 40;
    SEND_CHAT_REMOVED = 41;
    RECEIVE_ANNOUNCEMENT = 30;
    INVITE_VIA_EMAIL = 38;
    NOTIFIED_REGISTER_USER = 37;
    NOTIFIED_UNREGISTER_USER = 33;
    NOTIFIED_REQUEST_RECOVERY = 39;
    NOTIFIED_FORCE_SYNC = 42;
    SEND_CONTENT = 43;
    SEND_MESSAGE_MYHOME = 44;
    NOTIFIED_UPDATE_CONTENT_PREVIEW = 45;
    REMOVE_ALL_MESSAGES = 46;
    NOTIFIED_UPDATE_PURCHASES = 47;
    DUMMY = 48;
    UPDATE_CONTACT = 49;
    NOTIFIED_RECEIVED_CALL = 50;
    CANCEL_CALL = 51;
    NOTIFIED_REDIRECT = 52;
    NOTIFIED_CHANNEL_SYNC = 53;
    FAILED_SEND_MESSAGE = 54;
    NOTIFIED_READ_MESSAGE = 55;
    FAILED_EMAIL_CONFIRMATION = 56;
    NOTIFIED_PUSH_NOTICENTER_ITEM = 59;
    NOTIFIED_CHAT_CONTENT = 58;
    NOTIFIED_JOIN_CHAT = 60;
    NOTIFIED_LEAVE_CHAT = 61;
    NOTIFIED_TYPING = 62;
    FRIEND_REQUEST_ACCEPTED = 63;
    DESTROY_MESSAGE = 64;
    NOTIFIED_DESTROY_MESSAGE = 65;
    UPDATE_PUBLICKEYCHAIN = 66;
    NOTIFIED_UPDATE_PUBLICKEYCHAIN = 67;
    NOTIFIED_BLOCK_CONTACT = 68;
    NOTIFIED_UNBLOCK_CONTACT = 69;
    UPDATE_GROUPPREFERENCE = 70;
    NOTIFIED_PAYMENT_EVENT = 71;
    REGISTER_E2EE_PUBLICKEY = 72;
    NOTIFIED_E2EE_KEY_EXCHANGE_REQ = 73;
    NOTIFIED_E2EE_KEY_EXCHANGE_RESP = 74;
    NOTIFIED_E2EE_MESSAGE_RESEND_REQ = 75;
    NOTIFIED_E2EE_MESSAGE_RESEND_RESP = 76;
    NOTIFIED_E2EE_KEY_UPDATE = 77;
    NOTIFIED_BUDDY_UPDATE_PROFILE = 78;
    NOTIFIED_UPDATE_LINEAT_TABS = 79;
    UPDATE_ROOM = 80;
    NOTIFIED_BEACON_DETECTED = 81;
    UPDATE_EXTENDED_PROFILE = 82;
    ADD_FOLLOW = 83;
    NOTIFIED_ADD_FOLLOW = 84;
    DELETE_FOLLOW = 85;
    NOTIFIED_DELETE_FOLLOW = 86;
    UPDATE_TIMELINE_SETTINGS = 87;
    NOTIFIED_FRIEND_REQUEST = 88;
    UPDATE_RINGBACK_TONE = 89;
    NOTIFIED_POSTBACK = 90;
    RECEIVE_READ_WATERMARK = 91;
    NOTIFIED_MESSAGE_DELIVERED = 92;
    NOTIFIED_UPDATE_CHAT_BAR = 93;
    NOTIFIED_CHATAPP_INSTALLED = 94;
    NOTIFIED_CHATAPP_UPDATED = 95;
    NOTIFIED_CHATAPP_NEW_MARK = 96;
    NOTIFIED_CHATAPP_DELETED = 97;
    NOTIFIED_CHATAPP_SYNC = 98;
    NOTIFIED_UPDATE_MESSAGE = 99;
    UPDATE_CHATROOMBGM = 100;
    NOTIFIED_UPDATE_CHATROOMBGM = 101;
    UPDATE_RINGTONE = 102;
    UPDATE_USER_SETTINGS = 118;
    NOTIFIED_UPDATE_STATUS_BAR = 119;
    CREATE_CHAT = 120;
    UPDATE_CHAT = 121;
    NOTIFIED_UPDATE_CHAT = 122;
    INVITE_INTO_CHAT = 123;
    NOTIFIED_INVITE_INTO_CHAT = 124;
    CANCEL_CHAT_INVITATION = 125;
    NOTIFIED_CANCEL_CHAT_INVITATION = 126;
    DELETE_SELF__fromCHAT = 127;
    NOTIFIED_DELETE_SELF__fromCHAT = 128;
    ACCEPT_CHAT_INVITATION = 129;
    NOTIFIED_ACCEPT_CHAT_INVITATION = 130;
    REJECT_CHAT_INVITATION = 131;
    DELETE_OTHER__fromCHAT = 132;
    NOTIFIED_DELETE_OTHER__fromCHAT = 133;
}
enum OpStatus {
    NORMAL = 0;
    ALERT_DISABLED = 1;
    ALWAYS = 2;
}
struct Operation {
    1: i64 revision;
    2: i64 createdTime;
    3: OpType type;
    4: i32 reqSeq;
    5: string checksum;
    7: OpStatus status;
    10: string param1;
    11: string param2;
    12: string param3
    20: Message message
}

struct GroupCall {
    1: bool online;
    2: string chatMid;
    3: string hostMid;
    4: list<string> memberMids;
    5: i64 started;
    6: MediaType mediaType;
    7: ProtoCall protocol
}


enum ContactFlag  {
    CONTACT_SETTING_NOTIFICATION_DISABLE = 1;
    CONTACT_SETTING_DISPLAY_NAME_OVERRIDE = 2;
    CONTACT_SETTING_CONTACT_HIDE = 4;
    CONTACT_SETTING_FAVORITE = 8;
    CONTACT_SETTING_DELETE = 16;
}



struct CancelChatInvitationRequest {
    1: i32 reqSeq;
    2: string chatMid;
    3: set<string> targetUserMids;
}
enum IdentityProvider {
    UNKNOWN = 0;
    LINE = 1;
    NAVER_KR = 2;
    LINE_PHONE = 3;
}
enum SnsType {
    FACEBOOK = 1;
    SINA = 2;
    RENREN = 3;
    FEIXIN = 4;
    BBM = 5;
    APPLE = 6;
}
enum EmailConfirmationStatus {
    NOT_SPECIFIED = 0;
    NOT_YET = 1;
    DONE = 2;
    NEED_ENFORCED_INPUT = 3;
}
enum AccountMigrationPincodeType {
    NOT_AUTHENTICATED = 0;
    NOT_SET = 1;
    SET = 2;
    NEED_ENFORCED_INPU = 3;
}
enum SecurityCenterSettingsType {
    NOT_AUTHENTICATED = 0;
    NOT_SET = 1;
    SET = 2;
    NEED_ENFORCED_INPUT = 3;
}
enum CustomMode {
    PROMOTION_FRIENDS_INVITE = 1;
    CAPABILITY_SERVER_SIDE_SMS = 2;
    LINE_CLIENT_ANALYTICS_CONFIGURATION = 3;
}
struct Settings {
    10: bool notificationEnable
    11: i64 notificationMuteExpiration
    12: bool notificationNewMessage
    13: bool notificationGroupInvitation
    14: bool notificationShowMessage
    15: bool notificationIncomingCall
    16: string notificationSoundMessage
    17: string notificationSoundGroup
    18: bool notificationDisabledWithSub
    19: bool notificationPayment
    20: bool privacySyncContacts
    21: bool privacySearchByPhoneNumber
    22: bool privacySearchByUserid
    23: bool privacySearchByEmail
    24: bool privacyAllowSecondaryDeviceLogi
    25: bool privacyProfileImagePostToMyhome
    26: bool privacyReceiveMessagesFromNotFriend
    27: bool privacyAgreeUseLineCoinToPaidCall
    28: bool privacyAgreeUsePaidCall
    29: bool privacyAllowFriendRequest
    30: string contactMyTicket
    40: IdentityProvider identityProvider
    41: string identityIdentifier
    42: map<SnsType, string> snsAccounts
    43: bool phoneRegistration
    44: EmailConfirmationStatus emailConfirmationStatus
    45: AccountMigrationPincodeType accountMigrationPincodeType
    46: bool enforcedInputAccountMigrationPincode
    47: SecurityCenterSettingsType securityCenterSettingsType
    48: bool allowUnregistrationSecondaryDevice
    50: string preferenceLocale
    60: map<CustomMode, string> customModes
    61: bool e2eeEnable
    62: bool hitokotoBackupRequested
    63: bool privacyProfileMusicPostToMyhome
    65: bool privacyAllowNearby
    66: i64 agreementNearbyTime
    67: i64 agreementSquareTime
    68: bool notificationMention
    69: i64 botUseAgreementAcceptedAt
    70: i64 agreementShakeFunction
    71: i64 agreementMobileContactName
    72: bool notificationThumbnail
    73: i64 agreementSoundToText
    74: string privacyPolicyVersion
    75: i64 agreementAdByWebAccess
    76: i64 agreementPhoneNumberMatching
    77: i64 agreementCommunicationInfo
    78: bool privacySharePersonalInfoToFriends
    79: i64 agreementThingsWirelessCommunication
    80: i64 agreementGdpr
    81: bool privacyStatusMessageHistory
    82: i64 agreementProvideLocation
    83: i64 agreementBeacon
    85: bool privacyAllowProfileHistory
    86: i64 agreementContentsSuggest
    87: i64 agreementContentsSuggestDataCollection
    88: bool privacyAgeResult
    89: bool privacyAgeResultReceived
    90: i64 agreementOcrImageCollection
    91: bool privacyAllowFollow
    92: bool privacyShowFollowList
    93: bool notificationBadgeTalkOnly
}



enum SettingsAttributes {
    NOTIFICATION_ENABLE = 0;
    NOTIFICATION_MUTE_EXPIRATION = 1;
    NOTIFICATION_NEW_MESSAGE = 2;
    NOTIFICATION_GROUP_INVITATION = 3;
    NOTIFICATION_SHOW_MESSAGE = 4;
    NOTIFICATION_INCOMING_CALL = 5;
    NOTIFICATION_SOUND_MESSAGE = 8;
    NOTIFICATION_SOUND_GROUP = 9;
    NOTIFICATION_DISABLED_WITH_SUB = 16;
    NOTIFICATION_PAYMENT = 17;
    NOTIFICATION_MENTION = 40;
    NOTIFICATION_THUMBNAIL = 45;
    PRIVACY_SYNC_CONTACTS = 6;
    PRIVACY_SEARCH_BY_PHONE_NUMBER = 7;
    PRIVACY_SEARCH_BY_USERID = 13;
    PRIVACY_SEARCH_BY_EMAIL = 14;
    PRIVACY_SHARE_PERSONAL_INFO_TO_FRIENDS = 51;
    PRIVACY_ALLOW_SECONDARY_DEVICE_LOGIN = 21;
    PRIVACY_PROFILE_IMAGE_POST_TO_MYHOME = 23;
    PRIVACY_PROFILE_MUSIC_POST_TO_MYHOME = 35;
    PRIVACY_PROFILE_HISTORY = 57;
    PRIVACY_STATUS_MESSAGE_HISTORY = 54;
    PRIVACY_ALLOW_FRIEND_REQUEST = 30;
    PRIVACY_RECV_MESSAGES__fromNOT_FRIEND = 25;
    PRIVACY_AGREE_USE_LINECOIN_TO_PAIDCALL = 26;
    PRIVACY_AGREE_USE_PAIDCALL = 27;
    PRIVACY_AGE_RESULT = 60;
    PRIVACY_AGE_RESULT_RECEIVED = 61;
    PRIVACY_ALLOW_FOLLOW = 63;
    PRIVACY_SHOW_FOLLOW_LIST = 64;
    CONTACT_MY_TICKET = 10;
    IDENTITY_PROVIDER = 11;
    IDENTITY_IDENTIFIER = 12;
    SNS_ACCOUNT = 19;
    PHONE_REGISTRATION = 20;
    PREFERENCE_LOCALE = 15;
    CUSTOM_MODE = 22;
    EMAIL_CONFIRMATION_STATUS = 24;
    ACCOUNT_MIGRATION_PINCODE = 28;
    ENFORCED_INPUT_ACCOUNT_MIGRATION_PINCODE = 29;
    SECURITY_CENTER_SETTINGS = 18;
    E2EE_ENABLE = 33;
    HITOKOTO_BACKUP_REQUESTED = 34;
    CONTACT_ALLOW_FOLLOWING = 36;
    PRIVACY_ALLOW_NEARBY = 37;
    AGREEMENT_NEARBY = 38;
    AGREEMENT_SQUARE = 39;
    ALLOW_UNREGISTRATION_SECONDARY_DEVICE = 41;
    AGREEMENT_BOT_USE = 42;
    AGREEMENT_SHAKE_FUNCTION = 43;
    AGREEMENT_MOBILE_CONTACT_NAME = 44;
    AGREEMENT_SOUND_TO_TEXT = 46;
    AGREEMENT_PRIVACY_POLICY_VERSION = 47;
    AGREEMENT_AD_BY_WEB_ACCESS = 48;
    AGREEMENT_PHONE_NUMBER_MATCHING = 49;
    AGREEMENT_COMMUNICATION_INFO = 50;
    AGREEMENT_THINGS_WIRELESS_COMMUNICATION = 52;
    AGREEMENT_GDPR = 53;
    AGREEMENT_PROVIDE_LOCATION = 55;
    AGREEMENT_BEACON = 56;
    AGREEMENT_CONTENTS_SUGGEST = 58;
    AGREEMENT_CONTENTS_SUGGEST_DATA_COLLECTION = 59;
    AGREEMENT_OCR_IMAGE_COLLECTION = 62;
}

struct UpdateChatResponse {}

enum ChatAttribute   {
    NAME = 1;
    PICTURE_STATUS = 2;
    PREVENTED_JOIN_BY_TICKET = 4;
    NOTIFICATION_SETTING = 8;
    INVITATION_TICKET = 16;
    FAVORITE_TIMESTAMP = 32;
    CHAT_TYPE = 64;
}
struct UpdateChatRequest {
    1: i32 reqSeq;
    2: Chat chat;
    3: ChatAttribute updatedAttribute;
}
struct FriendRequestsInfo {
    1: i32 totalIncomingCount;
    2: i32 totalOutgoingCount
    3: list<FriendRequest> recentIncomings;
    4: list<FriendRequest> recentOutgoings;
    5: i32 totalIncomingLimit;
    6: i32 totalOutgoingLimit;
}

struct DeleteOtherFromChatRequest {
    1: i32 reqSeq;
    2: string chatMid;
    3: set<string> targetUserMids;
}

struct ContactRegistration {
    10: string luid
    11: MIDType contactType
    12: string contactKey
    13: Contact contact
}

struct DeleteOtherFromChatResponse {}

struct DeleteSelfFromChatResponse {}

struct DeleteSelfFromChatRequest {
    1: i32 reqSeq;
    2: string chatMid;
    3: i64 lastSeenMessageDeliveredTime;
    4: string lastSeenMessageId;
    5: i64 lastMessageDeliveredTime;
    6: string lastMessageId;
}
struct RejectChatInvitationResponse {}

struct RejectChatInvitationRequest {
    1: i32 reqSeq;
    2: string chatMid
}

struct TMessageReadRangeEntry {
    1: i64 startMessageId
    2: i64 endMessageId
    3: i64 startTime
    4: i64 endTime
}
struct TMessageReadRange {
    1: string chatMid;
    2: map<string, list<TMessageReadRangeEntry>> ranges
}

service TalkService {

    void tryFriendRequest(
        1: string midOrEMid,
        2: Method_ method,
        3: string friendRequestParams
    ) throws (1: TalkException e),

    void updateExtendedProfileAttribute(
        1: i32 reqSeq,
        2: UpdateExtendedProfileAttributeAttr attr,
        3: ExtendedProfile extendedProfile
    ) throws (1: TalkException e),

    void verifyAccountMigration(
        2: string migrationSessionId
    ) throws (1: TalkException e),

    void reportLocation(
        1: Geolocation location,
        2: Trigger trigger,
        3: ClientNetworkStatus networkStatus
    ) throws (1: TalkException e),

    list<PaidCallBalance> getPaidCallBalanceList(
        2: string language
    ) throws (1: TalkException e),

    CreateChatResponse createChat(
        1: CreateChatRequest requests
    ) throws (1: TalkException e),

    map<string, Contact> findAndAddContactsByMid(
        1: i32 reqSeq,
        2: string mid,
        3: MIDType type,
        4: string reference
    ) throws (1: TalkException e),

    Ticket generateUserTicket(
        3: i64 expirationTime,
        4: i32 maxUseCount
    ) throws (1: TalkException e),

    list<Contact> getContacts(
        2: list<string> ids
    ) throws (1: TalkException e),

    GetFollowersResponse getFollowers(
        2: GetFollowersRequest getFollowersRequest
    ) throws (1: TalkException e),

    map<string, E2EEPublicKey> getLastE2EEPublicKeys(
        2: string chatMid
    ) throws (1: TalkException e),

    void leaveRoom(
        1: i32 reqSeq,
        2: string roomId
    ) throws (1: TalkException e),

    void notifyRegistrationComplete(
        2: string udidHash,
        3: string applicationTypeWithExtensions
    ) throws (1: TalkException e),

    void removeChatRoomAnnouncement(
        1: i32 reqSeq,
        2: string chatRoomMid,
        3: i64 announcementSeq
    ) throws (1: TalkException e),

    void sendChatRemoved(
        1: i32 seq,
        2: string chatMid,
        3: string lastMessageId,
        4: binary sessionId
    ) throws (1: TalkException e),

    IdentityCredentialResponse updatePassword(
        2: string authSessionId,
        3: IdentityCredentialRequest request
    ) throws (1: TalkException e),

    void unblockContact(
        1: i32 reqSeq,
        2: string id,
        3: string reference
    ) throws (1: TalkException e),

    UserAuthStatus verifyIdentityCredentialWithResult(
        2: IdentityCredential identityCredential,
        3: string migrationPincodeSessionId
    ) throws (1: TalkException e),

    void requestCleanupUserProvidedData(
        1: set<DataTypes> dataTypes
    ) throws (1: TalkException e),

    BuddyStatusBar getBuddyStatusBarV2(
        1: GetBuddyStatusBarV2Request request
    ) throws (1: TalkException e),

   PaidCallHistoryResult getPaidCallHistory(
        2: i64 start,
        3: i32 size,
        4: string language
    ) throws (1: TalkException e),

    void blockContact(
        1: i32 reqSeq,
        2: string id
    ) throws (1: TalkException e),

    Group createGroupV2(
        1: i32 seq,
        2: string name
        3: list<string> contactIds
    ) throws (1: TalkException e),

    map<string, Contact> findAndAddContactsByPhone(
        1: i32 reqSeq,
        2: set<string> phones,
        3: string reference
    ) throws (1: TalkException e),

    set<string> getAcceptedProximityMatches(
        2: string sessionId
    ) throws (1: TalkException e),

    map<string, list<ChatRoomAnnouncement>> getChatRoomAnnouncementsBulk(
        2: list<string> chatRoomMids,
        3: SyncReason syncReason
    ) throws (1: TalkException e),

    list<string> getRecommendationIds(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    set<string> getCountries(
        2: CountryGroup countryGroup
    ) throws (1: TalkException e),

    GetFollowingsResponse getFollowings(
        2: GetFollowingsRequest getFollowingsRequest
    ) throws (1: TalkException e),

    i64 getLastOpRevision() throws (1: TalkException e),

    i64 getRingbackTone() throws (1: TalkException e),

    RegisterWithPhoneNumberResult registerWithPhoneNumber(
        1: string sessionId,
        2: string migrationPincodeSessionId
    ) throws (1: TalkException e),

    void report(
        2: i64 syncOpRevision,
        3: ReportCategory category,
        4: string report
    ) throws (1: TalkException e),

    void unblockRecommendation(
        1: i32 reqSeq,
        2: string id
    ) throws (1: TalkException e),

    void updateGroup(
        1: i32 reqSeq,
        2: Group group
    ) throws (1: TalkException e),

    list<BuddySearchResult> findBuddyContactsByQuery(
        2: string language,
        3: string country,
        4: string query,
        5: i32 fromIndex,
        6: i32 count,
        7: RequestsSource requestSource
    ) throws (1: TalkException e),

    PaidCallMetadataResult getPaidCallMetadata(
        2: string language
    ) throws (1: TalkException e),

    void blockRecommendation(
        1: i32 reqSeq,
        2: string id
    ) throws (1: TalkException e),

    map<string, Contact> findAndAddContactsByUserid(
        1: i32 reqSeq,
        2: string searchId,
        3: string reference
    ) throws (1: TalkException e),

    GetAllChatMidsResponse getAllChatMids(
        1: GetAllChatMidsRequest request,
        2: SyncReason syncReason
    ) throws (1: TalkException e),

    list<ChatRoomAnnouncement> getChatRoomAnnouncements(
        2: string chatRoomMids
    ) throws (1: TalkException e),

    string getCountryWithRequestIp() throws (1: TalkException e),

    list<FriendRequest> getFriendRequests(
        1: Direction direction,
        2: i64 lastSeenSeqId
    ) throws (1: TalkException e),

    Ringtone getRingtone() throws (1: TalkException e),

    void updateProfile(
        1: i32 reqSeq,
        2: Profile profile
    ) throws (1: TalkException e),

    void notifySleep(
        2: i64 lastRev,
        3: i32 badge
    ) throws (1: TalkException e),

    string registerWithSnsIdAndIdentityCredential(
        2: SnSIdTyoe snsIdType,
        3: string snsAccessToken,
        4: IdentityCredential identityCredential,
        5: string region,
        6: string udidHash,
        7: DeviceInfo deviceInfo,
        8: string migrationPincodeSessionId
    ) throws (1: TalkException e),

    void removeFollower(
        2: RemoveFollowerRequest removeFollowerRequest
    ) throws (1: TalkException e),

    void requestAccountPasswordReset(
        4: Provider provider,
        2: string identifier,
        5: string locale
    ) throws (1: TalkException e),

    void sendEchoPush(
        2: string text
    ) throws (1: TalkException e),

    void unfollow(
        2: UnfollowRequest unfollowRequest
    ) throws (1: TalkException e),

    void inviteIntoGroupCall(
        2: string chatMid,
        3: list<string> memberMids,
        4: MediaType mediaType
    ) throws (1: TalkException e),

    CancelChatInvitationResponse cancelChatInvitation(
        1: CancelChatInvitationRequest request
    ) throws (1: TalkException e),

    FindChatByTicketResponse findChatByTicket(
        1: FindChatByTicketRequest request
    ) throws (1: TalkException e),

    list<string> getAllContactIds(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    map<string, ChatRoomBGM> getChatRoomBGMs(
        2: set<string> chatRoomMids,
        3: SyncReason syncReason
    ) throws (1: TalkException e),

    E2EEGroupSharedKey getE2EEGroupSharedKey(
        2: i32 keyVersion,
        3: string chatMid,
        4: i32 groupKeyId
    ) throws (1: TalkException e),

    list<string> getGroupIdsInvited(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    Profile getProfile(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    void notifyUpdated(
        2: i64 lastRev,
        3: DeviceInfo deviceInfo,
        4: string udidHash,
        5: string oldUdidHash
    ) throws (1: TalkException e),

    RegisterWithSnsIdResult registerWithSnsId(
        2: SnSIdTyoe snsIdType,
        3: string snsAccessToken,
        4: string region,
        5: string udidHash,
        6: DeviceInfo deviceInfo,
        7: string mid
        8: string migrationPincodeSessionId
    ) throws (1: TalkException e),

    void removeFriendRequest(
        1: Direction direction,
        2: string midOrEMid
    ) throws (1: TalkException e),

    string openAuthSession(
        2: AuthSessionRequest request
    ) throws (1: TalkException e),

    string verifyQrcodeWithE2EE(
        2: string verifier,
        3: string pinCode,
        4: ErrorCode errorCode,
        5: E2EEPublicKey publicKey,
        6: binary encryptedKeyChain,
        7: binary hashKeyChain
    ) throws (1: TalkException e),

    GetBalanceResponse getBalance(
        1: GetBalanceRequest request
    ) throws (1: TalkException e),

    string unregisterUserAndDevice() throws (1: TalkException e),

    void updateNotificationToken(
        2: updateNotificationType type,
        3: string token
    ) throws (1: TalkException e),

    PhoneVerificationResult verifyPhoneNumber(
        2: string sessionId
        3: string pinCode,
        4: string udidHash,
        5: string migrationPincodeSessionId,
        6: string oldUdidHash
    ) throws (1: TalkException e),

    void cancelGroupInvitation(
        1: i32 reqSeq,
        2: string groupId,
        3: list<string> contactIds
    ) throws (1: TalkException e),

    Room createRoomV2(
        1: i32 reqSeq,
        2: list<string> contactIds
    ) throws (1: TalkException e),

    Contact findContactByMetaTag(
        2: string searchId,
        3: string reference
    ) throws (1: TalkException e),

    GetChatsResponse getChats(
        1: GetChatsRequest request
    ) throws (1: TalkException e),

    list<string> getGroupIdsJoined(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    list<Room> getRoomsV2(
        2: list<string> roomIds
    ) throws (1: TalkException e),

    ReissueChatTicketResponse reissueChatTicket(
        1: ReissueChatTicketRequest request
    ) throws (1: TalkException e),

    Message sendMessage(
        1: i32 seq,
        2: Message message
    ) throws (1: TalkException e),

    void unsendMessage(
        1: i32 seq,
        2: string messageId
    ) throws (1: TalkException e),

    GroupCallRoute acquireGroupCallRoute(
        2: string chatMid,
        3: MediaType mediaType,
        4: bool isInitialHost,
        5: list<string> capabilities
    ) throws (1: TalkException e),

    AcceptChatInvitationByTicketResponse acceptChatInvitationByTicket(
        1: AcceptChatInvitationByTicketRequest request
    ) throws (1: TalkException e),

    Contact findContactByUserTicket(
        2: string ticketIdWithTag
    ) throws (1: TalkException e),

    list<E2EEPublicKey> getE2EEPublicKey(
        2: string mid,
        3: i32 keyVersion,
        4: i32 keyId
    ) throws (1: TalkException e),

    string registerDeviceWithIdentityCredential(
        2: string sessionId,
        5: Provider provider,
        3: string identifier,
        4: string verifier,
        6: string migrationPincodeSessionId
    ) throws (1: TalkException e),

    string reissueGroupTicket(
        1: string groupMid
    ) throws (1: TalkException e),

    void updateProfileAttributes(
        1: i32 reqSeq,
        2: UpdateProfileAttributesRequest request
    ) throws (1: TalkException e),

    void updateProfileAttribute(
        1: i32 reqSeq,
        2: Attr attr,
        3: string value
    ) throws (1: TalkException e),

    string verifyQrcode(
        2: string verifier,
        3: string pinCode
    ) throws (1: TalkException e),

    AcceptChatInvitationResponse acceptChatInvitation(
        1: AcceptChatInvitationRequest request
    ) throws (1: TalkException e),

    string decryptFollowEMid(
        2: string eMid
    ) throws (1: TalkException e),

    Contact findContactByUserid(
        2: string searchId
    ) throws (1: TalkException e),

    i64 getServerTime() throws (1: TalkException e),

    InviteIntoChatResponse inviteIntoChat(
        1: InviteIntoChatRequest request
    ) throws (1: TalkException e),

    bool wakeUpLongPolling(
        2: i64 clientRevision
    ) throws (1: TalkException e),

    void acceptGroupInvitationByTicket(
        1: i32 reqSeq,
        2: string groupMid,
        3: string ticketId
    ) throws (1: TalkException e),

    DeleteOtherFromChatResponse deleteOtherFromChat(
        1: DeleteOtherFromChatRequest request
    ) throws (1: TalkException e),

    map<string, Contact> findContactsByPhone(
        2: set<string> phones
    ) throws (1: TalkException e),

    list<Group> getGroupsV2(
        2: list<string> groupId
    ) throws (1: TalkException e),

    list<Group> getGroups(
        2: list<string> groupId
    ) throws (1: TalkException e),

    Group getGroup(
        2: string groupId
    ) throws (1: TalkException e),

    Group getCompactGroup(
        2: string groupId
    ) throws (1: TalkException e),

    Group getGroupWithoutMembers(
        2: string groupId
    ) throws (1: TalkException e),

    void inviteIntoGroup(
        1: i32 reqSeq,
        2: string groupId,
        3: list<string> contactIds
    ) throws (1: TalkException e),

    void acceptGroupInvitation(
        1: i32 reqSeq,
        2: string groupId
    ) throws (1: TalkException e),

    list<TMessageReadRange> getMessageReadRange(
        2: list<string> chatIds,
        3: SyncReason syncReason
    ) throws (1: TalkException e),

    DeleteSelfFromChatResponse deleteSelfFromChat(
        1: DeleteSelfFromChatRequest request
    ) throws (1: TalkException e),

    list<string> getBlockedContactIds(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    Settings getSettingsAttributes2(
        2: set<SettingsAttributes> attributesToRetrieve
    ) throws (1: TalkException e),

    void inviteIntoRoom(
        1: i32 reqSeq,
        2: string roomId
        3: list<string> contactIds
    ) throws (1: TalkException e),

    RejectChatInvitationResponse rejectChatInvitation(
        1: RejectChatInvitationRequest request
    ) throws (1: TalkException e),

    list<string> getBlockedRecommendationIds(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    ChatRoomBGM updateChatRoomBGM(
        1: i32 reqSeq,
        2: string chatRoomMid,
        3: string chatRoomBGMInfo
    ) throws (1: TalkException e),

    Group findGroupByTicket(
        1: string ticketId
    ) throws (1: TalkException e),

    FriendRequestsInfo getRecentFriendRequests(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    Settings getSettingsAttributes(
        2: i32 attrBitset
    ) throws (1: TalkException e),

    void rejectGroupInvitation(
        1: i32 reqSeq,
        2: string groupId
    ) throws (1: TalkException e),

    UpdateChatResponse updateChat(
        1: UpdateChatRequest request
    ) throws (1: TalkException e),

    set<SettingsAttributes> updateSettingsAttributes2(
        1: i32 reqSeq,
        4: set<SettingsAttributes> attributesToUpdate
        3: Settings settings
    ) throws (1: TalkException e),


    ContactRegistration getContactRegistration(
        1: string id,
        2: MIDType type
    ) throws (1: TalkException e),

    Settings getSettings(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    void noop() throws (1: TalkException e),

    void removeAllMessages(
        1: i32 seq,
        2: string lastMessageId
    ) throws (1: TalkException e),

    void updateContactSetting(
        1: i32 reqSeq,
        2: string mid;
        3: ContactFlag flag,
        4: string value
    ) throws (1: TalkException e),

    GroupCall getGroupCall(
        2: string chatMid
    ) throws (1: TalkException e),

    list<Operation> fetchOps(
        2: i64 localRev,
        3: i32 count,
        4: i64 globalRev,
        5: i64 individualRev
    ) throws (1: TalkException e),

    list<Operation> fetchOperations(
        2: i64 localRev,
        3: i32 count
    ) throws(1: TalkException e);

    void kickoutFromGroup(
        1: i32 reqSeq,
        2: string groupId,
        3: list<string> contactIds
    ) throws (1: TalkException e),

    ExtendedProfile getExtendedProfile(
        1: SyncReason syncReason
    ) throws (1: TalkException e),

    string acquireEncryptedAccessToken(
        2: FeatureType featureType
    ) throws (1: TalkException e),

    ChatRoomAnnouncement createChatRoomAnnouncement(
        1: i32 reqSeq,
        2: string chatRoomMid,
        3: ChatRoomAnnouncementType type,
        4: ChatRoomAnnouncementContents contents
    ) throws (1: TalkException e),

    Contact findAndAddContactByMetaTag(
        1: i32 reqSeq,
        2: string searchId,
        3: string reference
    ) throws (1: TalkException e),

    void follow(
        2: FollowRequest followRequest
    ) throws (1: TalkException e),

    Contact getContact(
        2: string id
    ) throws (1: TalkException e),

    void leaveGroup(
        1: i32 reqSeq,
        2: string groupId
    ) throws (1: TalkException e),

    void sendChatChecked(
        1: i32 seq,
        2: string chatMid,
        3: string lastMessageId,
        4: binary sessionId
    ) throws (1: TalkException e),

    IdentityCredentialResponse updateIdentifier(
        2: string authSessionId
        3: IdentityCredentialRequest request
    ) throws (1: TalkException e),
}