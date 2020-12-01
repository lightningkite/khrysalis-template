// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: vg/DateRangeDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import Butterfly
import Foundation

public class DateRangeDemoVG : ViewGenerator {
    override public init() {
        self.start = StandardObservableProperty(underlyingValue: Date())
        self.endInclusive = StandardObservableProperty(underlyingValue: Date())
        self.dates = StandardObservableProperty(underlyingValue: Set([]))
        super.init()
        //Necessary properties should be initialized now
    }
    
    override public var title: String {
        get { return "Date Range Demo" }
    }
    
    public let start: StandardObservableProperty<Date?>
    public let endInclusive: StandardObservableProperty<Date?>
    public let dates: StandardObservableProperty<Set<Date>>
    
    override public func generate(dependency: ViewControllerAccess) -> UIView {
        let xml = DateRangeDemoXml()
        let view = xml.setup(dependency: dependency)
        
        
        xml.month2Delegate.dragEnabled = false
        xml.month2Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month2Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        xml.month3Delegate.dragEnabled = false
        xml.month3Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month3Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        xml.month4Delegate.dragEnabled = false
        xml.month4Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month4Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        
        return view
    }
    
}

