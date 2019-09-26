//Package: com.lightningkite.kwifttemplate.shared.api
//Converted using Kwift2

import Foundation



public protocol APIInterface {
    
    func getExamplePosts(onResult: @escaping (Int32, Array<Post>?, String?) -> Void) -> Void
}
 
