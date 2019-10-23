//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift



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
            dependency.requestLocation(100.0) { (it) in 
                self.locationInfo.value = it
            }
        }
        xml.locationDisplay.bindString(locationInfo.transformed{ (it) in 
            if let it = it {
                return "\(it.latitude), \(it.longitude)"
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
 
