//Package: com.lightningkite.kwifttemplate.vg
//Converted using Kwift2

import Foundation
import Kwift
import RxSwift
import RxRelay
import KwiftMaps



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
        xml.button.onClick(captureWeak(xml.button) { (button) in 
            var closeable = Ble.scan(viewDependency: dependency, withServices: [], intensity: Float(0.5), onDeviceFound: { (device) in 
                print("Found device \(device)")
                self.devices.value = self.devices.value + (device.id, device)
            })
            ( button.lifecycle.and(appInForeground) ).closeWhenOff(closeable)
        })
        xml.host.onClick{ () in 
            self.stack.push(BleHostDemoVG())
        }
        xml.items.bind(data: devices.map{ (it) in 
            it.values.sortedByDescending{ (it) in 
                it.rssi
            }
        }, defaultValue: BleDeviceInfo("", "", 0), makeView: { (obs) in 
            var cellXml = ComponentBleDeviceXml()
            var cellView = cellXml.setup(dependency)
            cellXml.deviceName.bindString(obs.map{ (it) in 
                it.name
            })
            cellXml.deviceId.bindString(obs.map{ (it) in 
                it.id
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
        let devices: MutableObservableProperty<Dictionary<String, BleDeviceInfo>> = StandardObservableProperty([:])
        self.devices = devices
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
