// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: vg/DateButtonDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import Foundation
import Khrysalis

public class DateButtonDemoVG : ViewGenerator {
    override public init() {
        self.date = StandardObservableProperty(underlyingValue: Date())
        super.init()
        //Necessary properties should be initialized now
    }
    
    override public var title: String {
        get { return "Date Button Demo" }
    }
    
    public let date: MutableObservableProperty<Date>
    
    override public func generate(dependency: ViewDependency) -> View {
        let xml = DateButtonDemoXml()
        let view = xml.setup(dependency: dependency)
        
        xml.text.bindString(observable: self.date.map(read: { (it) -> String in it.format(dateStyle: ClockPartSize.Medium, timeStyle: ClockPartSize.Medium) }))
        xml.dateButton.bind(date: self.date)
        xml.timeButton.bind(date: self.date)
        
        return view
    }
}


