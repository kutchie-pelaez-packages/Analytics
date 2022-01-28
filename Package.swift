// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "Analytics",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "AnalyticsTracker", targets: ["AnalyticsTracker"]),
        .library(name: "AnalyticsEvent", targets: ["AnalyticsEvent"])
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "AnalyticsTracker",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .target(name: "AnalyticsEvent")
            ]
        ),
        .target(name: "AnalyticsEvent")
    ]
)
