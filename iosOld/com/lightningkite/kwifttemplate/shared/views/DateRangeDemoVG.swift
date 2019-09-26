//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation



public class DateRangeDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Date Range Demo"
        }
    }
    public var start: StandardObservableProperty<Date?>
    public var endInclusive: StandardObservableProperty<Date?>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = DateRangeDemoXml()
        var view = xml.setup(dependency)
        xml.range.bind(start, endInclusive)
        xml.select.bind(start)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        self.start = StandardObservableProperty(Date())
        self.endInclusive = StandardObservableProperty(Date())
        super.init()
    }
}
 
