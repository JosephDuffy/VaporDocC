// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "VaporDocC",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "Run", targets: ["Run"]),
        .library(name: "VaporDocC", targets: ["VaporDocC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/Vapor.git", from: "4.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                .product(name: "Vapor", package: "Vapor"),
                "VaporDocC",
            ]
        ),
        .target(
            name: "VaporDocC",
            dependencies: [
                .product(name: "Vapor", package: "Vapor"),
            ]
        ),
        .testTarget(
            name: "VaporDocCTests",
            dependencies: ["VaporDocC"]
        ),
    ]
)
