//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class ExternalTestVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "External Test"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ExternalTestXml()
        var view = xml.setup(dependency)
        xml.openMap.onClick{ () in 
            dependency.openMap(GeoCoordinate(41.7269, -111.8432), "Lightning Kite", Float(14))
        }
        xml.openWeb.onClick{ () in 
            dependency.openUrl("https://lightningkite.com")
        }
        xml.openEvent.onClick{ () in 
            dependency.openEvent(title: "A Virtual Lunch with LK", description: "Come eat virtual food with us!", location: "Lightning Kite in Logan Utah", start: Date().addDayOfMonth(1).hourOfDay(12).minuteOfHour(0).secondOfMinute(0), end: Date().addDayOfMonth(1).hourOfDay(13).minuteOfHour(0).secondOfMinute(0))
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
