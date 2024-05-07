// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let onlineMusicSearch = try? JSONDecoder().decode(OnlineMusicSearch.self, from: jsonData)

import Foundation

// MARK: - OnlineMusicSearch
struct OnlineMusicSearch: Codable {
    let success: Bool?
    let message: String?
    let results: Results?
}

// MARK: - Results
struct Results: Codable {
    let continuationToken: String?
    let data: [Datum]?

    enum CodingKeys: String, CodingKey {
        case continuationToken = "continuation_token"
        case data
    }
}

// MARK: - Datum
struct Datum: Codable {
    let contents: [DatumContent]?
    let type: String?
    let title: ToggledTextClass?
    let continuation: String?
}

// MARK: - DatumContent
struct DatumContent: Codable {
    let duration: Duration?
    let thumbnail: Thumbnail?
    let overlay: Overlay?
    let artists: [Artist]?
    let itemType: ItemTypeEnum?
    let album: Album?
    let fixedColumns: [JSONAny]?
    let flexColumns: [FlexColumn]?
    let id: String?
    let type: FluffyType?
    let title: String?
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case duration, thumbnail, overlay, artists
        case itemType = "item_type"
        case album
        case fixedColumns = "fixed_columns"
        case flexColumns = "flex_columns"
        case id, type, title, menu
    }
}

// MARK: - Album
struct Album: Codable {
    let endpoint: AlbumEndpoint?
    let name, id: String?
}

// MARK: - AlbumEndpoint
struct AlbumEndpoint: Codable {
    let metadata: PurpleMetadata?
    let payload: PurplePayload?
    let type: EndpointType?
}

// MARK: - PurpleMetadata
struct PurpleMetadata: Codable {
    let apiURL: APIURL?

    enum CodingKeys: String, CodingKey {
        case apiURL = "api_url"
    }
}

enum APIURL: String, Codable {
    case browse = "/browse"
    case player = "/player"
}

// MARK: - PurplePayload
struct PurplePayload: Codable {
    let browseID: String?
    let browseEndpointContextSupportedConfigs: BrowseEndpointContextSupportedConfigs?

    enum CodingKeys: String, CodingKey {
        case browseID = "browseId"
        case browseEndpointContextSupportedConfigs
    }
}

// MARK: - BrowseEndpointContextSupportedConfigs
struct BrowseEndpointContextSupportedConfigs: Codable {
    let browseEndpointContextMusicConfig: BrowseEndpointContextMusicConfig?
}

// MARK: - BrowseEndpointContextMusicConfig
struct BrowseEndpointContextMusicConfig: Codable {
    let pageType: PageType?
}

enum PageType: String, Codable {
    case musicPageTypeAlbum = "MUSIC_PAGE_TYPE_ALBUM"
    case musicPageTypeArtist = "MUSIC_PAGE_TYPE_ARTIST"
}

enum EndpointType: String, Codable {
    case navigationEndpoint = "NavigationEndpoint"
}

// MARK: - Artist
struct Artist: Codable {
    let endpoint: AlbumEndpoint?
    let name, channelID: String?

    enum CodingKeys: String, CodingKey {
        case endpoint, name
        case channelID = "channel_id"
    }
}

// MARK: - Duration
struct Duration: Codable {
    let seconds: Int?
    let text: String?
}

// MARK: - FlexColumn
struct FlexColumn: Codable {
    let displayPriority: DisplayPriority?
    let type: FlexColumnType?
    let title: FlexColumnTitle?

    enum CodingKeys: String, CodingKey {
        case displayPriority = "display_priority"
        case type, title
    }
}

enum DisplayPriority: String, Codable {
    case musicResponsiveListItemColumnDisplayPriorityHigh = "MUSIC_RESPONSIVE_LIST_ITEM_COLUMN_DISPLAY_PRIORITY_HIGH"
}

// MARK: - FlexColumnTitle
struct FlexColumnTitle: Codable {
    let endpoint: TitleEndpoint?
    let text: String?
    let runs: [ToggledTextRun]?
}

// MARK: - TitleEndpoint
struct TitleEndpoint: Codable {
    let metadata: PurpleMetadata?
    let payload: FluffyPayload?
    let type: EndpointType?
}

// MARK: - FluffyPayload
struct FluffyPayload: Codable {
    let videoID: String?
    let watchEndpointMusicSupportedConfigs: WatchEndpointMusicSupportedConfigs?
    let browseID: String?
    let browseEndpointContextSupportedConfigs: BrowseEndpointContextSupportedConfigs?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case watchEndpointMusicSupportedConfigs
        case browseID = "browseId"
        case browseEndpointContextSupportedConfigs
    }
}

// MARK: - WatchEndpointMusicSupportedConfigs
struct WatchEndpointMusicSupportedConfigs: Codable {
    let watchEndpointMusicConfig: WatchEndpointMusicConfig?
}

// MARK: - WatchEndpointMusicConfig
struct WatchEndpointMusicConfig: Codable {
    let musicVideoType: MusicVideoType?
}

enum MusicVideoType: String, Codable {
    case musicVideoTypeAtv = "MUSIC_VIDEO_TYPE_ATV"
}

// MARK: - ToggledTextRun
struct ToggledTextRun: Codable {
    let endpoint: TitleEndpoint?
    let italics: Bool?
    let text: String?
    let bold, strikethrough: Bool?
}

enum FlexColumnType: String, Codable {
    case musicResponsiveListItemFlexColumn = "MusicResponsiveListItemFlexColumn"
}

enum ItemTypeEnum: String, Codable {
    case song = "song"
}

// MARK: - Menu
struct Menu: Codable {
    let topLevelButtons: [JSONAny]?
    let label: Label?
    let type: MenuType?
    let items: [ItemElement]?

    enum CodingKeys: String, CodingKey {
        case topLevelButtons = "top_level_buttons"
        case label, type, items
    }
}

// MARK: - ItemElement
struct ItemElement: Codable {
    let endpoint: ItemEndpoint?
    let text: TextUnion?
    let type: ItemType?
    let iconType: IconType?
    let toggledText: ToggledTextClass?
    let toggledEndpoint: ToggledEndpoint?
    let defaultEndpoint: DefaultEndpoint?
    let toggledIconType: ToggledIconType?

    enum CodingKeys: String, CodingKey {
        case endpoint, text, type
        case iconType = "icon_type"
        case toggledText = "toggled_text"
        case toggledEndpoint = "toggled_endpoint"
        case defaultEndpoint = "default_endpoint"
        case toggledIconType = "toggled_icon_type"
    }
}

// MARK: - DefaultEndpoint
struct DefaultEndpoint: Codable {
    let metadata: PayloadClass?
    let payload: DefaultEndpointPayload?
    let type: EndpointType?
    let modal: DefaultEndpointModal?
}

// MARK: - PayloadClass
struct PayloadClass: Codable {
}

// MARK: - DefaultEndpointModal
struct DefaultEndpointModal: Codable {
    let button: ModalButton?
    let type: ModalType?
    let title, content: ToggledTextClass?
}

// MARK: - ModalButton
struct ModalButton: Codable {
    let endpoint: ButtonEndpoint?
    let isDisabled: Bool?
    let text: ButtonText?
    let type: ButtonType?

    enum CodingKeys: String, CodingKey {
        case endpoint
        case isDisabled = "is_disabled"
        case text, type
    }
}

// MARK: - ButtonEndpoint
struct ButtonEndpoint: Codable {
    let metadata: PayloadClass?
    let payload: SignInEndpointClass?
    let type: EndpointType?
}

// MARK: - SignInEndpointClass
struct SignInEndpointClass: Codable {
    let hack: Bool?
}

enum ButtonText: String, Codable {
    case improveRecommendationsAndSaveMusicAfterSigningIn = "Improve recommendations and save music after signing in"
    case likeThisSong = "Like this song"
    case makePlaylistsAndShareThemAfterSigningIn = "Make playlists and share them after signing in"
    case saveThisForLater = "Save this for later"
    case signIn = "Sign in"
    case songAddedToQueue = "Song added to queue"
    case songWillPlayNext = "Song will play next"
}

enum ButtonType: String, Codable {
    case button = "Button"
}

// MARK: - ToggledTextClass
struct ToggledTextClass: Codable {
    let text: TitleText?
    let runs: [ToggledTextRun]?
}

enum TitleText: String, Codable {
    case addToLikedSongs = "Add to liked songs"
    case improveRecommendationsAndSaveMusicAfterSigningIn = "Improve recommendations and save music after signing in"
    case likeThisSong = "Like this song"
    case makePlaylistsAndShareThemAfterSigningIn = "Make playlists and share them after signing in"
    case removeFromLikedSongs = "Remove from liked songs"
    case saveThisForLater = "Save this for later"
    case songs = "Songs"
}

enum ModalType: String, Codable {
    case modalWithTitleAndButton = "ModalWithTitleAndButton"
}

// MARK: - DefaultEndpointPayload
struct DefaultEndpointPayload: Codable {
    let modal: PayloadModal?
}

// MARK: - PayloadModal
struct PayloadModal: Codable {
    let modalWithTitleAndButtonRenderer: ModalWithTitleAndButtonRenderer?
}

// MARK: - ModalWithTitleAndButtonRenderer
struct ModalWithTitleAndButtonRenderer: Codable {
    let button: ModalWithTitleAndButtonRendererButton?
    let title, content: TitleClass?
}

// MARK: - ModalWithTitleAndButtonRendererButton
struct ModalWithTitleAndButtonRendererButton: Codable {
    let buttonRenderer: ButtonRenderer?
}

// MARK: - ButtonRenderer
struct ButtonRenderer: Codable {
    let trackingParams: String?
    let style: Style?
    let isDisabled: Bool?
    let text: TitleClass?
    let navigationEndpoint: NavigationEndpoint?
}

// MARK: - NavigationEndpoint
struct NavigationEndpoint: Codable {
    let clickTrackingParams: String?
    let signInEndpoint: SignInEndpointClass?
}

enum Style: String, Codable {
    case styleBlueText = "STYLE_BLUE_TEXT"
}

// MARK: - TitleClass
struct TitleClass: Codable {
    let runs: [SuccessResponseTextRun]?
}

// MARK: - SuccessResponseTextRun
struct SuccessResponseTextRun: Codable {
    let text: ButtonText?
}

// MARK: - ItemEndpoint
struct ItemEndpoint: Codable {
    let metadata: PurpleMetadata?
    let payload: TentacledPayload?
    let type: EndpointType?
    let modal: DefaultEndpointModal?
}

// MARK: - TentacledPayload
struct TentacledPayload: Codable {
    let playlistID, videoID: String?
    let params: Params?
    let loggingContext: LoggingContext?
    let watchEndpointMusicSupportedConfigs: WatchEndpointMusicSupportedConfigs?
    let queueTarget: QueueTarget?
    let queueInsertPosition: QueueInsertPosition?
    let commands: [Command]?
    let modal: PayloadModal?
    let browseID: String?
    let browseEndpointContextSupportedConfigs: BrowseEndpointContextSupportedConfigs?
    let serializedShareEntity: String?
    let sharePanelType: SharePanelType?

    enum CodingKeys: String, CodingKey {
        case playlistID = "playlistId"
        case videoID = "videoId"
        case params, loggingContext, watchEndpointMusicSupportedConfigs, queueTarget, queueInsertPosition, commands, modal
        case browseID = "browseId"
        case browseEndpointContextSupportedConfigs, serializedShareEntity, sharePanelType
    }
}

// MARK: - Command
struct Command: Codable {
    let addToToastAction: AddToToastAction?
    let clickTrackingParams: String?
}

// MARK: - AddToToastAction
struct AddToToastAction: Codable {
    let item: AddToToastActionItem?
}

// MARK: - AddToToastActionItem
struct AddToToastActionItem: Codable {
    let notificationTextRenderer: NotificationTextRenderer?
}

// MARK: - NotificationTextRenderer
struct NotificationTextRenderer: Codable {
    let trackingParams: String?
    let successResponseText: TitleClass?
}

// MARK: - LoggingContext
struct LoggingContext: Codable {
    let vssLoggingContext: VssLoggingContext?
}

// MARK: - VssLoggingContext
struct VssLoggingContext: Codable {
    let serializedContextData: String?
}

enum Params: String, Codable {
    case wAEB = "wAEB"
}

enum QueueInsertPosition: String, Codable {
    case insertAfterCurrentVideo = "INSERT_AFTER_CURRENT_VIDEO"
    case insertAtEnd = "INSERT_AT_END"
}

// MARK: - QueueTarget
struct QueueTarget: Codable {
    let onEmptyQueue: OnEmptyQueue?
    let videoID: String?

    enum CodingKeys: String, CodingKey {
        case onEmptyQueue
        case videoID = "videoId"
    }
}

// MARK: - OnEmptyQueue
struct OnEmptyQueue: Codable {
    let clickTrackingParams: String?
    let watchEndpoint: WatchEndpoint?
}

// MARK: - WatchEndpoint
struct WatchEndpoint: Codable {
    let videoID: String?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
    }
}

enum SharePanelType: String, Codable {
    case sharePanelTypeUnifiedSharePanel = "SHARE_PANEL_TYPE_UNIFIED_SHARE_PANEL"
}

enum IconType: String, Codable {
    case addToPlaylist = "ADD_TO_PLAYLIST"
    case addToRemoteQueue = "ADD_TO_REMOTE_QUEUE"
    case album = "ALBUM"
    case artist = "ARTIST"
    case favorite = "FAVORITE"
    case mix = "MIX"
    case queuePlayNext = "QUEUE_PLAY_NEXT"
    case share = "SHARE"
}

enum TextUnion: Codable {
    case enumeration(PurpleText)
    case toggledTextClass(ToggledTextClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(PurpleText.self) {
            self = .enumeration(x)
            return
        }
        if let x = try? container.decode(ToggledTextClass.self) {
            self = .toggledTextClass(x)
            return
        }
        throw DecodingError.typeMismatch(TextUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TextUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .toggledTextClass(let x):
            try container.encode(x)
        }
    }
}

enum PurpleText: String, Codable {
    case addToQueue = "Add to queue"
    case goToAlbum = "Go to album"
    case goToArtist = "Go to artist"
    case playNext = "Play next"
    case saveToPlaylist = "Save to playlist"
    case share = "Share"
    case startRadio = "Start radio"
}

// MARK: - ToggledEndpoint
struct ToggledEndpoint: Codable {
    let metadata, payload: PayloadClass?
    let type: EndpointType?
}

enum ToggledIconType: String, Codable {
    case unfavorite = "UNFAVORITE"
}

enum ItemType: String, Codable {
    case menuNavigationItem = "MenuNavigationItem"
    case menuServiceItem = "MenuServiceItem"
    case toggleMenuServiceItem = "ToggleMenuServiceItem"
}

enum Label: String, Codable {
    case actionMenu = "Action menu"
}

enum MenuType: String, Codable {
    case menu = "Menu"
}

// MARK: - Overlay
struct Overlay: Codable {
    let displayStyle: DisplayStyle?
    let type: OverlayType?
    let content: OverlayContent?
    let contentPosition: ContentPosition?

    enum CodingKeys: String, CodingKey {
        case displayStyle = "display_style"
        case type, content
        case contentPosition = "content_position"
    }
}

// MARK: - OverlayContent
struct OverlayContent: Codable {
    let endpoint: ContentEndpoint?
    let iconColor: Int?
    let pauseIconType: PauseIconType?
    let playLabel, pauseLabel: String?
    let type: PurpleType?
    let playIconType: PlayIconType?

    enum CodingKeys: String, CodingKey {
        case endpoint
        case iconColor = "icon_color"
        case pauseIconType = "pause_icon_type"
        case playLabel = "play_label"
        case pauseLabel = "pause_label"
        case type
        case playIconType = "play_icon_type"
    }
}

// MARK: - ContentEndpoint
struct ContentEndpoint: Codable {
    let metadata: PurpleMetadata?
    let payload: StickyPayload?
    let type: EndpointType?
}

// MARK: - StickyPayload
struct StickyPayload: Codable {
    let videoID: String?
    let watchEndpointMusicSupportedConfigs: WatchEndpointMusicSupportedConfigs?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case watchEndpointMusicSupportedConfigs
    }
}

enum PauseIconType: String, Codable {
    case pause = "PAUSE"
}

enum PlayIconType: String, Codable {
    case playArrow = "PLAY_ARROW"
}

enum PurpleType: String, Codable {
    case musicPlayButton = "MusicPlayButton"
}

enum ContentPosition: String, Codable {
    case musicItemThumbnailOverlayContentPositionCentered = "MUSIC_ITEM_THUMBNAIL_OVERLAY_CONTENT_POSITION_CENTERED"
}

enum DisplayStyle: String, Codable {
    case musicItemThumbnailOverlayDisplayStylePersistent = "MUSIC_ITEM_THUMBNAIL_OVERLAY_DISPLAY_STYLE_PERSISTENT"
}

enum OverlayType: String, Codable {
    case musicItemThumbnailOverlay = "MusicItemThumbnailOverlay"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let contents: [ThumbnailContent]?
    let type: ThumbnailType?
}

// MARK: - ThumbnailContent
struct ThumbnailContent: Codable {
    let width: Int?
    let url: String?
    let height: Int?
}

enum ThumbnailType: String, Codable {
    case musicThumbnail = "MusicThumbnail"
}

enum FluffyType: String, Codable {
    case musicResponsiveListItem = "MusicResponsiveListItem"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
