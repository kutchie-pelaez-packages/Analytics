import AnalyticsEvent
import CoreUtils
import Foundation
import os

final class AnalyticsTrackerImpl:
    StartableProvider,
    AnalyticsTracker
{

    init(engines: [AnalyticsTracker]) {
        self.engines = engines
    }

    private let engines: [AnalyticsTracker]

    private var enginesAndLogger: [AnalyticsTracker] {
        [loggerEngine] + engines
    }

    private lazy var loggerEngine: AnalyticsTracker = {
        AnalyticsLoggerEngine(enginesDescription: enginesDescription)
    }()

    private var enginesDescription: String {
        engines
            .map(\.description)
            .joined(separator: ", ")
    }

    // MARK: - StartableProvider

    var startable: Startable {
        Startables(from: engines)
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
