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
    public var devices: MutableObservableProperty<Dictionary<String, BleScanResult>>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = BleScanDemoXml()
        var view = xml.setup(dependency)
        xml.button.onClick(captureWeak(xml.button){ (button) in 
            Ble.scan(viewDependency: dependency).subscribeBy{ (result) in 
                self.devices.value = self.devices.value + (result.info.id, result)
            }.until(button.removed)
        })
        xml.host.onClick{ () in 
            self.stack.push(BleHostDemoVG())
        }
        xml.items.bind(data: devices.map{ (it) in 
            it.values.sortedByDescending{ (it) in 
                it.rssi
            }
        }, defaultValue: BleScanResult(BleDeviceInfo("", ""), -1000), makeView: { (obs) in 
            var cellXml = ComponentBleDeviceXml()
            var cellView = cellXml.setup(dependency)
            cellXml.deviceName.bindString(obs.map{ (it) in 
                it.info.name ?? "No Name"
            })
            cellXml.deviceId.bindString(obs.map{ (it) in 
                it.info.id
            })
            cellXml.rssi.bindString(obs.map{ (it) in 
                it.rssi.toString()
            })
            cellXml.connect.onClick{ () in 
            }
            return cellView
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        let devices: MutableObservableProperty<Dictionary<String, BleScanResult>> = StandardObservableProperty([:])
        self.devices = devices
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
