//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation
@testable import Core

extension PackageVersion {
    
    static let mock = PackageVersion(value: "1.0.0")
    
    static let majorMock = PackageVersion(value: "2.0.0")
    static let minorMock = PackageVersion(value: "1.1.0")
    static let patchMock = PackageVersion(value: "1.0.1")
}


// MARK: - Equatable

extension PackageVersion: Equatable {
    public static func == (lhs: PackageVersion, rhs: PackageVersion) -> Bool {
        lhs.value == rhs.value
    }
}
