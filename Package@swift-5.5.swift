// swift-tools-version:5.5
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
        .package(name: "vapor", url: "https://github.com/vapor/Vapor.git", from: "4.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "VaporDocC",
            ]
        ),
        .target(
            name: "VaporDocC",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
            ],
            exclude: ["VaporDocC.docc"]
        ),
        .testTarget(
            name: "VaporDocCTests",
            dependencies: ["VaporDocC"]
        ),
    ]
)
