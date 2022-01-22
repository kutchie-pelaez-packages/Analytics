import AnalyticsEvent
import CoreUtils
import os

private let logger = Logger("analytics")

final class AnalyticsLoggerEngine: AnalyticsTracker {
    init(enginesDescription: String) {
        self.enginesDescription = enginesDescription
    }

    private let enginesDescription: String

    // MARK: - Startable

    func start() { }

    // MARK: - CustomStringConvertible

    var description: String {
        "Analytics Logger"
    }

    // MARK: - CustomStringConvertible

    func track(_ event: AnalyticsEvent) {
        var message = "Tracking \"\(event.name)\" to \(self.enginesDescription)"
        if event.parameters.isNotEmpty {
            message += " - \(event.parameters)"
        }
        logger.log("\(message)")
    }

    func track(_ userProperties: AnalyticsUserProperties) {
        logger.log("Tracking \(userProperties) to \(self.enginesDescription)")
    }
}
