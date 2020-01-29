//Package: com.lightningkite.khrysalistemplate.api
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public protocol APIInterface {
    
    func getExamplePosts(onResult: @escaping (Int32, Array<Post>?, String?) -> Void) -> Void
}
 
