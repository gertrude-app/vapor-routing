// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "vapor-routing",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .library(
      name: "VaporRouting",
      targets: ["VaporRouting"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    // depend on custom fork to avoid bringing in swift-syntax via case-paths
    // @see https://github.com/pointfreeco/swift-url-routing/pull/104
    .package(url: "https://github.com/gertrude-app/swift-url-routing", revision: "1cf1ca6"),
  ],
  targets: [
    .target(
      name: "VaporRouting",
      dependencies: [
        .product(name: "Vapor", package: "vapor"),
        .product(name: "URLRouting", package: "swift-url-routing"),
      ]
    ),
    .testTarget(
      name: "VaporRoutingTests",
      dependencies: [
        "VaporRouting",
        .product(name: "XCTVapor", package: "vapor"),
      ]
    ),
  ]
)
