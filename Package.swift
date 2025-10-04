// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "VoteFlow",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "VoteFlow",
            targets: ["VoteFlow"]),
    ],
    dependencies: [
        .package(url: "https://github.com/BNE003/FeatureFlowGit", branch: "main")
    ],
    targets: [
        .target(
            name: "VoteFlow",
            dependencies: [
                .product(name: "FeatureFlow", package: "FeatureFlowGit")
            ],
            resources: [.process("requirements.md")]),
        .testTarget(
            name: "VoteFlowTests",
            dependencies: ["VoteFlow"]),
    ]
)
