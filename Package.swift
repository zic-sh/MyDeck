// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyDeck",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MyDeck",
            targets: ["MyDeck"]),
    ],
    dependencies: [
        .package(url: "https://github.com/zic-sh/MyShuffle.git", branch: "master"),
        .package(url: "https://github.com/zic-sh/MyCard.git", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MyDeck",
            dependencies: ["MyCard","MyShuffle"]
        ),
        .testTarget(
            name: "MyDeckTests",
            dependencies: ["MyDeck"]
        ),
    ]
)
