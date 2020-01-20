//Package: com.lightningkite.kwifttemplate.api
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public protocol APIInterface {
    
    func getExamplePosts(onResult: @escaping (Int32, Array<Post>?, String?) -> Void) -> Void
}
 
