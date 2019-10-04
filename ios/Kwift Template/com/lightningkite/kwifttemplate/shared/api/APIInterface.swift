//Package: com.lightningkite.kwifttemplate.shared.api
//Converted using Kwift2

import Foundation
import Kwift



public protocol APIInterface {
    
    func getExamplePosts(onResult: @escaping (Int32, Array<Post>?, String?) -> Void) -> Void
}
 
