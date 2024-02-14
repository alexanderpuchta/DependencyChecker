//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Git
    
    static func gitLsMockWithVersion(_ version: String) -> String {
        """
            23a8863b7f0dacfb4a289de2db1200b88c02aa5f\t    refs/tags/0.0.1\n
            23a8863b7f0dacfb4a289de2db1200b88c02aa5f\t    refs/tags/\(version)
        """
    }
    
    // MARK: - Packages
    
    static let packageNameMock = "Dependency-Checker"
    static let urlStringMock = "https://github.com/alexanderpuchta/DependencyChecker"
    
    // MARK: - Versions
    
    static let versionDefaultMock = "1.0.0"
    static let versionMajorMock = "2.0.0"
    static let versionMinorMock = "1.1.0"
    static let versionPatchMock = "1.0.1"
}
