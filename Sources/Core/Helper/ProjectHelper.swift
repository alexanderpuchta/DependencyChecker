//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Files
import Foundation

protocol ProjectHelperRepresentable {
    func parse(_ path: String) throws -> [Folder]
}


// MARK: - ProjectHelper

struct ProjectHelper {}


// MARK: - ProjectHelperError

enum ProjectHelperError: Error {
    case projectNotFound
}


// MARK: - ProjectHelperRepresentable

extension ProjectHelper: ProjectHelperRepresentable {
    
    func parse(_ path: String) throws -> [Folder] {
        
        guard let projectName = path.components(separatedBy: "/").last else {
            throw ProjectHelperError.projectNotFound
        }
        
        let folder = try Folder(path: Constants.derivedDataPath)
        let projectFolders = folder.subfolders.filter { $0.name.hasPrefix(projectName) }
        
        return projectFolders
    }
}
