import AnalyticsEvent
import Core
import Foundation
import Logger

final class AnalyticsTrackerImpl: AnalyticsTracker {
    init(
        engines: [AnalyticsTracker],
        logger: Logger
    ) {
        self.engines = engines
        self.logger = logger
    }

    private let engines: [AnalyticsTracker]
    private let logger: Logger

    private var enginesAndLogger: [AnalyticsTracker] {
        [loggerEngine] + engines
    }

    private lazy var loggerEngine: AnalyticsTracker = {
        AnalyticsLoggerEngine(
            logger: logger,
            enginesDescription: enginesDescription
        )
    }()

    private var enginesDescription: String {
        engines
            .map(\.description)
            .joined(separator: ", ")
    }

    // MARK: - CustomStringConvertible

    var description: String {
        if enginesDescription.isEmpty {
            return "Empty Analytics Tracker"
        } else {
            return "Analytics Tracker with [\(enginesDescription)] engines"
        }
    }

    // MARK: - AnalyticsTracker

    func track(_ event: AnalyticsEvent) {
        enginesAndLogger.forEach {
            $0.track(event)
        }
    }

    func track(_ userProperties: AnalyticsUserProperties) {
        enginesAndLogger.forEach {
            $0.track(userProperties)
        }
    }
}
