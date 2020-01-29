//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class BleHostDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "BleHostDemo"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = BleHostDemoXml()
        var view = xml.setup(dependency)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
