import AnalyticsEvent
import Core
import Logger

final class AnalyticsLoggerEngine: AnalyticsTracker {
    init?(
        environment: Environment,
        logger: Logger,
        enginesDescription: String
    ) {
        guard environment.isDev else { return nil }

        self.logger = logger
        self.enginesDescription = enginesDescription
    }

    private let logger: Logger
    private let enginesDescription: String

    // MARK: - Startable

    func start() { }

    // MARK: - CustomStringConvertible

    var description: String {
        "Analytics Logger"
    }

    // MARK: - AnalyticsTracker

    func track(_ event: AnalyticsEvent) {
        var message = "Tracking \"\(event.name)\" to \(self.enginesDescription)..."
        if event.parameters.isNotEmpty {
            message += " Parameters: \(event.parameters)"
        }
        logger.log(message, domain: .analytics)
    }

    func track(_ userProperties: AnalyticsUserProperties) {
        logger.log("Tracking \(userProperties) to \(self.enginesDescription...)", domain: .analytics)
    }
}

extension LogDomain {
    fileprivate static let analytics: Self = "analytics"
}
