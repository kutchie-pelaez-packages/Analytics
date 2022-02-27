public enum AnalyticsAction: RawRepresentable {
    case open
    case close
    case custom(String)

    public init?(rawValue: String) {
        switch rawValue {
        case Self.open.rawValue:
            self = .open

        case Self.close.rawValue:
            self = .close

        default:
            self = .custom(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .open:
            return "open"

        case .close:
            return "close"

        case let .custom(name):
            return name
        }
    }
}
