//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class ExampleContentVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Example Content"
        }
    }
    public var number: StandardObservableProperty<Int32>
    public var chained: StandardObservableProperty<MutableObservableProperty<Int32>>
    
    public func increment() -> Void {
        number.value += 1
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ExampleContentXml()
        var view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick(captureWeak(self){ (self) in 
            self.increment()
        })
        xml.exampleContentNumber.bindText(number){ (it) in 
            it.toString()
        }
        xml.chainedIncrement.onClick{ () in 
            self.chained.value.value = self.chained.value.value + 1
        }
        xml.chainedNumber.bindString(chained.flatMap{ (it) in 
            it
        }.map{ (it) in 
            it.toString()
        })
        xml.scrollToTop.onClick(captureWeak(xml.scrollView){ (it) in 
            it.smoothScrollTo(0, 0)
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let number: StandardObservableProperty<Int32> = StandardObservableProperty(0)
        self.number = number
        let chained: StandardObservableProperty<MutableObservableProperty<Int32>> = StandardObservableProperty(StandardObservableProperty(0))
        self.chained = chained
        super.init()
    }
}
 