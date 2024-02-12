//
//  Copyright © 2024 alexanderpuchta.de -  All rights reserved.
//

let tool = DependencyCheckerTool()

do {
    try tool.run()
} catch {
    print("something went totally wrong..", error.localizedDescription)
}
