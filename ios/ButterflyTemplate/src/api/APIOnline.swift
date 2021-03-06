// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: api/APIOnline.kt
// Package: com.lightningkite.butterflytemplate.api
import RxSwift
import Butterfly
import Foundation

public class APIOnline : APIInterface {
    public var baseUrl: String
    public init(baseUrl: String = "https://jsonplaceholder.typicode.com") {
        self.baseUrl = baseUrl
        //Necessary properties should be initialized now
    }
    
    public func getExamplePosts() -> Single<Array<Post>> {
        return HttpClient.INSTANCE.call(url: self.baseUrl + "/posts", method: HttpClient.INSTANCE.GET, headers: dictionaryOf()).readJson()
    }
    
}


