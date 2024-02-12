//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct ResolvedPackage: Decodable {
    
    let identity: String
    let url: URL
    let version: PackageVersion
    
    enum CodingKeys: String, CodingKey {
        
        case identity
        case url = "location"
        case version = "state"
    }
    
    
    // MARK: - Init
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let urlString = try container.decode(String.self, forKey: .url)
        
        guard let url = URL(string: urlString) else {
            throw ResolvedPackageError.invalidURL
        }
        
        self.url = url
        self.identity = try container.decode(String.self, forKey: .identity)
        
        let resolvedVersion = try container.decode(ResolvedVersion.self, forKey: .version)
        self.version = PackageVersion(value: resolvedVersion.number)
    }
}


// MARK: - Error

enum ResolvedPackageError: Error {
    case invalidURL
}
