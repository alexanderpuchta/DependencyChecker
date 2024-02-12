//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

enum DependencyLocation: String, Decodable {
    
    case invisible
    case shared
    case visible
    case workspace
}
