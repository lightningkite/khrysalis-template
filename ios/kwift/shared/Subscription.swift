import Foundation
//package com.lightningkite.kwift.shared


//import com.lightningkite.kwift.actuals.escaping

final public class Subscription<T>{
    public var listener: (T) -> Bool
    public var identifier: Int 
    
    init( listener: @escaping (T) -> Bool, identifier: Int = 0 ) {
        self.listener = listener
        self.identifier = identifier
    }
    convenience init(
        _ listener: @escaping (T) -> Bool,
        _ identifier: Int = 0
    ){ 
        self.init(
            listener: listener,
            identifier: identifier
        ) 
    }
}
