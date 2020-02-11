//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class MainVG: ViewGenerator, EntryPoint {
    
    
    override public var title: String {
        get {
            return "Main"
        }
    }
    public var stack: ObservableStack<ViewGenerator>
    public var mainStack: ObservableStack<ViewGenerator>? {
        get {
            return stack
        }
    }
    public var shouldBackBeShown: ObservableProperty<Bool>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MainXml()
        var view = xml.setup(dependency)
        xml.mainContent.bindStack(dependency, stack)
        xml.title.bindString(stack.map{ (it) in 
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
    
    public func handleDeepLink(schema: String, host: String, path: String, params: Dictionary<String, String>) -> Void {
        stack.push(ExampleContentVG())
    }
    public func handleDeepLink(_ schema: String, _ host: String, _ path: String, _ params: Dictionary<String, String>) -> Void {
        return handleDeepLink(schema: schema, host: host, path: path, params: params)
    }
    
    override public init() {
        let stack: ObservableStack<ViewGenerator> = ObservableStack<ViewGenerator>()
        self.stack = stack
        let shouldBackBeShown: ObservableProperty<Bool> = stack.map{ (it) in 
            it.size > 1
        }
        self.shouldBackBeShown = shouldBackBeShown
        super.init()
        stack.push(SelectDemoVG(stack))
    }
}
 
