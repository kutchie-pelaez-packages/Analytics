public enum AnalyticsAction: RawRepresentable {
    case open
    case close
    case perform
    case custom(String)

    public var rawValue: String {
        switch self {
        case .open: return "open"
        case .close: return "close"
        case .perform: return "perform"
        case let .custom(name): return name
        }
    }

    public init?(rawValue: String) {
        switch rawValue {
        case Self.open.rawValue: self = .open
        case Self.close.rawValue: self = .close
        case Self.perform.rawValue: self = .perform
        default: self = .custom(rawValue)
        }
    }
}
