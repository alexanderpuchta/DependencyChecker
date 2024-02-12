//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

import Foundation
import Factory

protocol DerivedDataHelperRepresentable {
    func clean() throws
}


// MARK: - DerivedDataHelper

struct DerivedDataHelper {
    
    @Injected(\.shellHelper)
    private var shellHelper
}


// MARK: - DerivedDataHelperRepresentable

extension DerivedDataHelper: DerivedDataHelperRepresentable {
    
    func clean() throws {
        _ = try shellHelper.execute(.xcode)
    }
}
