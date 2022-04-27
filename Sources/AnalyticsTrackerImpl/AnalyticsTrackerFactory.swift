import Analytics
import Core
import Logger

public struct AnalyticsTrackerFactory {
    public init() { }

    public func produce(
        environment: Environment,
        engines: [AnalyticsTracker],
        logger: Logger
    ) -> AnalyticsTracker {
        AnalyticsTrackerImpl(
            environment: environment,
            engines: engines,
            logger: logger
        )
    }
}
