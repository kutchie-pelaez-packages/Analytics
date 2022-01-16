public struct AnalyticsEvent {
    public init(
        name: String,
        parameters: [String: Any]
    ) {
        self.name = name
        self.parameters = parameters
    }

    public let name: String
    public let parameters: [String: Any]
}
