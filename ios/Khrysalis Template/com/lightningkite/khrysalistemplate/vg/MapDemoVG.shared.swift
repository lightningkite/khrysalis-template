//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class MapDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Map Demo"
        }
    }
    public var text: StandardObservableProperty<String>
    public var position: StandardObservableProperty<GeoCoordinate?>
    public var options: StandardObservableProperty<Array<GeoAddress>>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MapDemoXml()
        var view = xml.setup(dependency)
        xml.map.bindSelect(dependency, position)
        xml.select.bindString(text)
        xml.options.bind(options, GeoAddress()){ (obs) in 
            var xml = ComponentTextXml()
            var view = xml.setup(dependency)
            xml.label.bindString(obs.transformed{ (it) in 
                it.oneLine()
            })
            xml.xmlRoot.onClick{ () in 
                self.position.value = obs.value.coordinate
            }
            return view
        }
        text.addAndRunWeak(self){ (self, value) in 
            delay(1000){ () in 
                if self.text.value == value, value.isNotBlank() {
                    dependency.geocode(value){ (addresses) in 
                        self.options.value = addresses
                    }
                }
            }
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let text: StandardObservableProperty<String> = StandardObservableProperty("")
        self.text = text
        let position: StandardObservableProperty<GeoCoordinate?> = StandardObservableProperty(nil)
        self.position = position
        let options: StandardObservableProperty<Array<GeoAddress>> = StandardObservableProperty([])
        self.options = options
        super.init()
    }
}
 
