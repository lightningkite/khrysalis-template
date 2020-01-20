//Package: com.lightningkite.kwifttemplate.api
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class APIMock: APIInterface {
    
    
    
    //Start Companion
    static public var delayMs: Int64 = 150
    static public var lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    //End Companion
    
    
    public func getExamplePosts(onResult: @escaping (Int32, Array<Post>?, String?) -> Void) -> Void {
        delay(APIMock.delayMs) { () in 
            onResult(200, [Post(title: "First", body: APIMock.lorem)], nil)
        }
    }
    
    public init() {
    }
}
 
