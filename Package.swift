// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DiffMatchPatch",
    products: [
        .library(
            name: "DiffMatchPatch",
            targets: ["DiffMatchPatch"]
        ),
    ],
    targets: [
        .target(
            name: "diff-match-patch",
            cSettings: [.unsafeFlags(["-fno-objc-arc"])]
        ),
        .target(
            name: "DiffMatchPatch",
            dependencies: [.target(name: "diff-match-patch")]
        ),
        .testTarget(
            name: "DiffMatchPatchTests",
            dependencies: ["DiffMatchPatch"]
        ),
    ]
)
