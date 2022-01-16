import AnalyticsEvent
import CoreUtils

public protocol AnalyticsTracker:
    Startable,
    CustomStringConvertible
{

    func track(_ event: AnalyticsEvent)
    func track(_ userProperties: AnalyticsUserProperties)
}
