//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Factory
import Foundation

public enum DependencyCheckerError: Error {
    case missingConfiguration
}

public struct DependencyChecker {
    
    @Injected(\.configurationHelper)
    private var configurationHelper
    
    @Injected(\.derivedDataHelper)
    private var derivedDataHelper
    
    @Injected(\.packageChecker)
    private var packageChecker
    
    @Injected(\.resolvedPackages)
    private var resolvedPackages
    
    var configuration: Configuration?
    let fileName: String
    
    
    // MARK: - Init
    
    public init(fileName: String) {
        
        self.fileName = fileName
        
        self.configure()
    }
    
    public func start() throws {
        
        guard let configuration else {
            throw DependencyCheckerError.missingConfiguration
        }
        
        let packages = try self.resolvedPackages.find(at: configuration.locations)
        let messages = try packages
            .map(self.packageChecker.check(package:))
            .filter { configuration.levels.contains($0.level) }
            .map(\.message)
        
        messages.forEach { output in
            print(output.value)
        }
    }
}


// MARK: - Helper

private extension DependencyChecker {
    
    mutating func configure() {
        do {
            
            let yamlConfiguration = try self.configurationHelper.get(file: self.fileName)
            self.configuration = Configuration(
                levels: yamlConfiguration.messages,
                locations: yamlConfiguration.locations,
                versions: yamlConfiguration.versions
            )
        } catch {
            fatalError("please provide a valid yaml file.")
        }
    }
}


// MARK: - Output

private extension DependencyOutput {
    
    var value: String {
        [
            "warning:",
            self.level.icon,
            self.message
        ]
        .joined(separator: " ")
    }
}


private extension PackageCheckerResult.Level {
    
    var icon: String {
        switch self {
        case .major:
            "🚀"
            
        case .minor:
            "🦺"
            
        case .none:
            ""
            
        case .patch:
            "🩹"
        }
    }
}
