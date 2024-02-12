//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct ResolvedFile: Decodable {
    
    let packages: [ResolvedPackage]
    let version: Int
    
    enum CodingKeys: String, CodingKey {
        
        case packages = "pins"
        case version
    }
}
