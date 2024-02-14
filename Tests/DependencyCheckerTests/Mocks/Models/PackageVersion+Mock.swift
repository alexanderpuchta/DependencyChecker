//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation
@testable import Core

extension PackageVersion {
    
    static let mock = PackageVersion(value: .versionDefaultMock)
    
    static let majorMock = PackageVersion(value: .versionMajorMock)
    static let minorMock = PackageVersion(value: .versionMinorMock)
    static let patchMock = PackageVersion(value: .versionPatchMock)
}


// MARK: - Equatable

extension PackageVersion: Equatable {
    public static func == (lhs: PackageVersion, rhs: PackageVersion) -> Bool {
        lhs.value == rhs.value
    }
}
