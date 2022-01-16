import AnalyticsEvent
import CoreUtils
import Foundation
import os

private let logger = Logger("analytics")

final class AnalyticsTrackerImpl:
    StartableProvider,
    AnalyticsTracker
{

    init(engines: [AnalyticsTracker]) {
        self.engines = engines
    }

    private let engines: [AnalyticsTracker]

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
        "Analytics Tracker with [\(enginesDescription)] engines"
    }

    // MARK: - AnalyticsTracker

    func track(_ event: AnalyticsEvent) {
        var message = "Tracking \"\(event.name)\" to \(self.enginesDescription)"
        if event.parameters.isNotEmpty {
            message += " - \(event.parameters)"
        }
        logger.log("\(message)")

        engines.forEach {
            $0.track(event)
        }
    }

    func track(_ userProperties: AnalyticsUserProperties) {
        logger.log("Tracking \(userProperties) to \(self.enginesDescription)")

        engines.forEach {
            $0.track(userProperties)
        }
    }
}
