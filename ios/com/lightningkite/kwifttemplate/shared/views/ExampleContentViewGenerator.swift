//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation



public class ExampleContentViewGenerator: ViewGenerator {
    
    public var stack: ObservableStack<ViewGenerator>
    
    override public var title: String {
        get {
            return "Example Content"
        }
    }
    public var number: StandardObservableProperty<Int32>
    
    public func increment() -> Void {
        number.value += 1
    }
    
    public func goToAnotherScreen() -> Void {
        stack.push(SwitchManiaVG(stack))
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ExampleContentXml()
        var view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick(captureWeak(self) { (self) in 
            self.increment()
        })
        xml.exampleContentGoToAnotherScreen.onClick(captureWeak(self) { (self) in 
            self.goToAnotherScreen()
        })
        xml.exampleContentNumber.bindText(number) { (it) in 
            it.toString()
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        self.number = StandardObservableProperty(0)
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
