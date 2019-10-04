//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift



public class WeekDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Week Demo"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = WeekDemoXml()
        var view = xml.setup(dependency)
        xml.week.bind(data: ConstantObservableProperty{ (start, end) in 
            [WeekViewEvent(id: 0, title: "Event", start: Date(), end: Date() + 1.hours(), colorRes: ResourcesColors.colorPrimary)]
        }, onEventClick: { (it) in 
            print(it)
        }, onEmptyClick: { (it) in 
            print(it)
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
