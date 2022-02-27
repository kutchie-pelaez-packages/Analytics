public struct AnalyticsDomain: ExpressibleByStringLiteral, CustomStringConvertible {
    let rawValue: String

    // MARK: - ExpressibleByStringLiteral

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    // MARK: - CustomStringConvertible

    public var description: String {
        rawValue
    }
}
