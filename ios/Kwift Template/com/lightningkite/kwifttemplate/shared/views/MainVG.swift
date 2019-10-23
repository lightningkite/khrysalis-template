//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift



public class MainVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Main"
        }
    }
    public var stack: ObservableStack<ViewGenerator>
    public var shouldBackBeShown: ObservableProperty<Bool>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MainXml()
        var view = xml.setup(dependency)
        xml.mainContent.bindStack(dependency, stack)
        xml.title.bindString(stack.transformed{ (it) in 
            it.lastOrNull()?.title ?? ""
        })
        xml.mainBack.bindVisible(shouldBackBeShown)
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
        let stack: ObservableStack<ViewGenerator> = ObservableStack<ViewGenerator>()
        self.stack = stack
        let shouldBackBeShown: ObservableProperty<Bool> = stack.transformed{ (it) in 
            it.size > 1
        }
        self.shouldBackBeShown = shouldBackBeShown
        super.init()
        stack.push(SelectDemoVG(stack))
    }
}
 
