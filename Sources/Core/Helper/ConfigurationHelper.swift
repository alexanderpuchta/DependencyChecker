//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Files
import Foundation
import Yams

protocol ConfigurationHelperRepresentable {
    func get(file name: String) throws -> DependencyConfiguration
}


// MARK: - ConfigurationHelper

struct ConfigurationHelper {}


// MARK: - ConfigurationHelperRepresentable

extension ConfigurationHelper: ConfigurationHelperRepresentable {
    
    func get(file name: String) throws -> DependencyConfiguration {
        
        let file = try Folder.current.file(named: name)
        let data = try file.read()
        return try YAMLDecoder().decode(DependencyConfiguration.self, from: data)
    }
}
