//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class BleScanDemoVG: ViewGenerator {
    
    public var stack: ObservableStack<ViewGenerator>
    
    override public var title: String {
        get {
            return "BleScanDemo"
        }
    }
    public var devices: MutableObservableProperty<Dictionary<String, BleDeviceInfo>>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = BleScanDemoXml()
        var view = xml.setup(dependency)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        let devices: MutableObservableProperty<Dictionary<String, BleDeviceInfo>> = StandardObservableProperty([:])
        self.devices = devices
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
