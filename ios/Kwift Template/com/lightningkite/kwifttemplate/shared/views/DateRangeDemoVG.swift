//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class DateRangeDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Date Range Demo"
        }
    }
    public var start: StandardObservableProperty<Date?>
    public var endInclusive: StandardObservableProperty<Date?>
    public var dates: StandardObservableProperty<Set<Date>>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = DateRangeDemoXml()
        var view = xml.setup(dependency)
        xml.range.bind(start, endInclusive)
        xml.multi.bind(dates)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let start: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
        self.start = start
        let endInclusive: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
        self.endInclusive = endInclusive
        let dates: StandardObservableProperty<Set<Date>> = StandardObservableProperty([])
        self.dates = dates
        super.init()
    }
}
 
