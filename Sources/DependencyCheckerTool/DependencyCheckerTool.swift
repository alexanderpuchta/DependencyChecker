//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import ArgumentParser
import Core
import Foundation

@main
struct DependencyCheckerTool: ParsableCommand {
    
    @Option(
        name: .long,
        help: "Add a custom configuration path. Default is dependency-checker.yml"
    )
    var config: String?
    
    
    // MARK: - Run
    
    func run() throws {
        
        let checker = DependencyChecker(fileName: config ?? Constants.configFileName)
        try checker.start()
    }
}


private enum Constants {
    static let configFileName = "dependency-checker.yml"
}
