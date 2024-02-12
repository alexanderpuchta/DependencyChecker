//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation

final class DependencyCheckerTool {
    
    @Injected(\.packageChecker)
    private var packageChecker
    
    private let arguments: [String]
    
    
    // MARK: - Init
    
    init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    
    // MARK: - Run
    
    func run() throws {
        
        let package = SwiftPackage(
            current: PackageVersion(value: "9.0.0"),
            name: "PermissionsKit",
            url: URL(string: "https://github.com/sparrowcode/PermissionsKit")!
        )
        
        let result = try packageChecker.check(package: package)
        print("warning:", result.message)
    }
}
