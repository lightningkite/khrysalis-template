//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class DateButtonDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Date Button Demo"
        }
    }
    public var date: MutableObservableProperty<Date>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = DateButtonDemoXml()
        var view = xml.setup(dependency)
        xml.text.bindString(date.map{ (it) in 
            it.format(ClockPartSize.Medium, ClockPartSize.Medium)
        })
        xml.dateButton.bind(date)
        xml.timeButton.bind(date)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let date: MutableObservableProperty<Date> = StandardObservableProperty(Date())
        self.date = date
        super.init()
    }
}
 