import Analytics
import Core
import Foundation
import Logger

final class AnalyticsTrackerImpl: AnalyticsTracker {
    private let environment: Environment
    private let engines: [AnalyticsTracker]
    private let logger: Logger

    private var enginesAndLogger: [AnalyticsTracker] {
        [loggerEngine].unwrapped() + engines
    }

    private lazy var loggerEngine: AnalyticsTracker? = {
        AnalyticsLoggerEngine(
            environment: environment,
            logger: logger,
            enginesDescription: enginesDescription
        )
    }()

    private var enginesDescription: String {
        engines
            .map(\.description)
            .joined(separator: ", ")
    }

    init(
        environment: Environment,
        engines: [AnalyticsTracker],
        logger: Logger
    ) {
        self.environment = environment
        self.engines = engines
        self.logger = logger
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
