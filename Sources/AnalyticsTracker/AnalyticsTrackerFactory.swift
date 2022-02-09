import Core
import Logger

public struct AnalyticsTrackerFactory {
    public init() { }

    public func produce(
        engines: [AnalyticsTracker],
        logger: Logger
    ) -> AnalyticsTracker {
        AnalyticsTrackerImpl(
            engines: engines,
            logger: logger
        )
    }
}
