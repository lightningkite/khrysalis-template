// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: vg/MainVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import Foundation
import Khrysalis

public class MainVG : ViewGenerator, EntryPoint {
    override public init() {
        let stack: ObservableStack<ViewGenerator> = (ObservableStack() as ObservableStack<ViewGenerator>)
        self.stack = stack
        super.init()
        //Necessary properties should be initialized now
        self.shouldBackBeShown = self.stack.map(read: { (it) -> Bool in it.count > 1 })
        self.stack.push(t: SelectDemoVG(stack: self.stack))
    }
    
    override public var title: String {
        get { return "Main" }
    }
    
    public let stack: ObservableStack<ViewGenerator>
    public var mainStack: ObservableStack<ViewGenerator>? {
        get { return self.stack }
    }
    public var shouldBackBeShown: (ObservableProperty<Bool>)!
    
    
    
    override public func generate(dependency: ViewDependency) -> View {
        let xml = MainXml()
        let view = xml.setup(dependency: dependency)
        
        xml.mainContent.bindStack(dependency: dependency, obs: self.stack)
        xml.title.bindString(observable: self.stack.map(read: { (it) -> String in it.last?.title ?? "" }))
        xml.mainBack.bindVisible(observable: self.shouldBackBeShown)
        xml.mainBack.onClick(action: { () -> Void in self.stack.pop() })
        
        return view
    }
    
    public func handleDeepLink(schema: String, host: String, path: String, params: Dictionary<String, String>) -> Void {
        self.stack.push(t: ExampleContentVG())
    }
    
}


