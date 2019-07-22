import Foundation
///Kotlin Only
//@file:Suppress("ConvertToStringTemplate", "RemoveExplicitTypeArguments")
//
///End Kotlin Only

//package com.lightningkite.kwifttemplate.shared.api


//import com.lightningkite.kwift.actuals.*
//import com.lightningkite.kwifttemplate.shared.models.*
//import java.util.*


final public class APIOnline : APIInterface {
    
    public var baseUrl: String 
    
    init( baseUrl: String = "https://jsonplaceholder.typicode.com") {
        self.baseUrl = baseUrl
    }
    convenience init(
        _ baseUrl: String 
    ){ 
        self.init(
            baseUrl: baseUrl
        ) 
    }
    
    public func getExamplePosts( onResult: @escaping (Int, [Post]?, String?) -> Void) {
        HttpClient.call(
            url : baseUrl + "/posts",
            method : HttpClient.GET,
            headers : [String: String](),
            body : nil,
            onResult : onResult
        )
    }
    
}
