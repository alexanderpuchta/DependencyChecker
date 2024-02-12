//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct ResolvedVersion: Decodable {
    
    let number: String
    
    enum CodingKeys: String, CodingKey {
        case number = "version"
    }
}
