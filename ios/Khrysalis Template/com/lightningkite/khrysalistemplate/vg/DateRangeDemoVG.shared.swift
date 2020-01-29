//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



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
        xml.month2Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month2Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        xml.month3Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month3Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        xml.month4Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month4Delegate.selectedPaint.color = 0xFFFF0000.asColor()
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
 
