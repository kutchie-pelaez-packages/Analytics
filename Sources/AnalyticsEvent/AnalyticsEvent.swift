import Core
import Foundation

public struct AnalyticsEvent {
    public init(
        name: String,
        parameters: [String: Any]
    ) {
        self.name = name
        self.parameters = parameters
    }

    public init(
        domain: AnalyticsDomain,
        name: String,
        parameters: [String : Any] = [:]
    ) {
        let fullname = domain.rawValue
            .camelCaseChunks
            .map(\.capitalized)
            .joined(separator: " ") +
            " - " +
            name

        self.init(
            name: fullname,
            parameters: parameters
        )
    }

    public init(
        domain: AnalyticsDomain,
        action: AnalyticsAction,
        parameters: [String : Any] = [:]
    ) {
        let name = action.rawValue
            .camelCaseChunks
            .map(\.capitalized)
            .joined(separator: " ")

        self.init(
            domain: domain,
            name: name,
            parameters: parameters
        )
    }

    public let name: String
    public let parameters: [String: Any]
}
