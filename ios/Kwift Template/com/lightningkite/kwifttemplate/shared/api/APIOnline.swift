//Package: com.lightningkite.kwifttemplate.shared.api
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class APIOnline: APIInterface {
    
    public var baseUrl: String
    
    
    public func getExamplePosts(onResult: @escaping (Int32, Array<Post>?, String?) -> Void) -> Void {
        HttpClient.call(url: baseUrl + "/posts", method: HttpClient.GET, headers: [:], body: nil, onResult: onResult)
    }
    
    public init(baseUrl: String = "https://jsonplaceholder.typicode.com") {
        self.baseUrl = baseUrl
    }
    convenience public init(_ baseUrl: String) {
        self.init(baseUrl: baseUrl)
    }
}
 
