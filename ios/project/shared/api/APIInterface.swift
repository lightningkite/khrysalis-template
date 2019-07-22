import Foundation
//package com.lightningkite.kwifttemplate.shared.api


//import com.lightningkite.kwift.actuals.Empty
//import com.lightningkite.kwift.actuals.ImageData
//import com.lightningkite.kwift.actuals.escaping
//import com.lightningkite.kwifttemplate.shared.models.*

public protocol APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    
    
    func getExamplePosts(
        onResult: @escaping (Int, [Post]?, String?) -> Void
    )
}
