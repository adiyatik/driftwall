// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Driftwall",
    platforms: [.macOS(.v13)],
    targets: [
        .executableTarget(
            name: "Driftwall",
            path: "Sources/Driftwall"
        )
    ]
)
