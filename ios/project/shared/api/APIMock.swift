import Foundation
//package com.lightningkite.kwifttemplate.shared.api


//import com.lightningkite.kwift.actuals.*
//import com.lightningkite.kwifttemplate.shared.models.*
//import java.util.*

final public class APIMock : APIInterface {
    
    
    
    init() {
    }
    
    
    static var delayMs: Int64 = 150
    static var lorem = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """.trimIndent()
    
    
    public func getExamplePosts( onResult: @escaping (Int, [Post]?, String?) -> Void) {
        delay(APIMock.delayMs){
            onResult(200, [Post(title : "First", body : APIMock.lorem)], nil)
        }
    }
}
