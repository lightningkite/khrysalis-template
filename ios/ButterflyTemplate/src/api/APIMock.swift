// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: api/APIMock.kt
// Package: com.lightningkite.butterflytemplate.api
import RxSwift
import Butterfly
import Foundation

public class APIMock : APIInterface {
    public init() {
        //Necessary properties should be initialized now
    }
    
    
    public class Companion {
        public init() {
            self.delayMs = 150
            self.lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            //Necessary properties should be initialized now
        }
        public static let INSTANCE = Companion()
        
        public var delayMs: Int64
        public let lorem: String
    }
    
    public func getExamplePosts() -> Single<Array<Post>> {
        return Single.just([Post(title: "First", body: APIMock.Companion.INSTANCE.lorem)]).delay(.milliseconds(Int(1000)), scheduler: MainScheduler.instance)
    }
}

