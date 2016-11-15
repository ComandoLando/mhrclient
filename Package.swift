/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

import PackageDescription

let package = Package(
    name: "Dealer",
    dependencies: [
        .Package(url: "https://github.com/p2/OAuth2.git", majorVersion: 3),
        .Package(url: "https://github.com/ComandoLando/swift-fhir.git", majorVersion: 1)
    ]
)
