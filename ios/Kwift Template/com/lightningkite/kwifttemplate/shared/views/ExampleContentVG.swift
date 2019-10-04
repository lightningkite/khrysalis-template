//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift



public class ExampleContentVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Example Content"
        }
    }
    public var number: StandardObservableProperty<Int32>
    
    public func increment() -> Void {
        number.value += 1
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ExampleContentXml()
        var view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick(captureWeak(self) { (self) in 
            self.increment()
        })
        xml.exampleContentNumber.bindText(number) { (it) in 
            it.toString()
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let number: StandardObservableProperty<Int32> = StandardObservableProperty(0)
        self.number = number
        super.init()
    }
}
 
