//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class BleClientDemoVG: ViewGenerator {
    
    public var deviceId: String
    
    override public var title: String {
        get {
            return "BleHostDemo"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = BleClientDemoXml()
        var view = xml.setup(dependency)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public init(deviceId: String) {
        self.deviceId = deviceId
        super.init()
    }
    convenience public init(_ deviceId: String) {
        self.init(deviceId: deviceId)
    }
}
 
