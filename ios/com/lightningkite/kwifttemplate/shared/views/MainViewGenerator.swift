//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation



public class MainViewGenerator: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Main"
        }
    }
    public var stack: ObservableStack<ViewGenerator>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MainXml()
        var view = xml.setup(dependency)
        xml.mainContent.bindStack(dependency, stack)
        xml.title.bindText(stack) { (it) in 
            (it.lastOrNull()?.title) ?? ""
        }
        xml.mainBack.bindVisible(stack.transformed{ (it) in 
            it.size > 1
        })
        xml.mainBack.onClick(captureWeak(self) { (self) in 
            self.stack.pop()
            ()
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        self.stack = ObservableStack<ViewGenerator>()
        super.init()
        stack.push(ExampleContentViewGenerator(stack))
    }
}
 
