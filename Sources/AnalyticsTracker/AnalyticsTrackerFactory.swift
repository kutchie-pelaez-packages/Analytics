import CoreUtils

public struct AnalyticsTrackerFactory {
    public init() { }

    public func produce(engines: [AnalyticsTracker]) -> AnalyticsTracker {
        AnalyticsTrackerImpl(engines: engines)
    }
}
