//Package: com.lightningkite.kwifttemplate.vg
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class LocationDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Location Demo"
        }
    }
    public var locationInfo: MutableObservableProperty<LocationResult?>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = LocationDemoXml()
        var view = xml.setup(dependency)
        xml.getLocation.onClick{ () in 
            dependency.requestLocation(accuracyBetterThanMeters: 100.0, timeoutInSeconds: 5.0) { (location, message) in 
                print(message)
                self.locationInfo.value = location
            }
        }
        xml.locationDisplay.bindString(locationInfo.transformed{ (it) in 
            if let it = it {
                return "\(it.coordinate)"
            } else {
                return "Nothing yet"
            }
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let locationInfo: MutableObservableProperty<LocationResult?> = StandardObservableProperty<LocationResult?>(nil)
        self.locationInfo = locationInfo
        super.init()
    }
}
 
