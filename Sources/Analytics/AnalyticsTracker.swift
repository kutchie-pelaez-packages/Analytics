public protocol AnalyticsTracker: CustomStringConvertible {
    func track(_ event: AnalyticsEvent)
    func track(_ userProperties: AnalyticsUserProperties)
}
