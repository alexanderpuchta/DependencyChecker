//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation

struct DependencyConfiguration: Decodable {
    
    let locations: [DependencyLocation]
    let messages: [DependencyMessage]
    let versions: [DependencyVersion]
}
