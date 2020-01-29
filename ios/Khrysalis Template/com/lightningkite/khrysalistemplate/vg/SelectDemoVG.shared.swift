//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class SelectDemoVG: ViewGenerator, EntryPoint {
    
    
    public weak var stack: ObservableStack<ViewGenerator>? 
    override public var title: String {
        get {
            return "Select Demo"
        }
    }
    public var options: Array<ViewGenerator>
    
    public func selectVG(viewGenerator: ViewGenerator) -> Void {
        stack?.push(viewGenerator)
    }
    public func selectVG(_ viewGenerator: ViewGenerator) -> Void {
        return selectVG(viewGenerator: viewGenerator)
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = SelectDemoXml()
        var view = xml.setup(dependency)
        xml.list.bind(data: ConstantObservableProperty(options), defaultValue: options.first(), makeView: { (obs) in 
            var xml = ComponentTestXml()
            var view = xml.setup(dependency)
            xml.label.bindText(obs) { (it) in 
                it.title
            }
            xml.button.onClick(captureWeak(self) { (self) in 
                self.selectVG(obs.value)
            })
            return view
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    public var mainStack: ObservableStack<ViewGenerator>? {
        get {
            return stack
        }
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        let options: Array<ViewGenerator> = [BleScanDemoVG(stack), PongDemoVG(), FloatingHexagonsDemoVG(), MarginTestsVG(), MultipleDemoVG(), DateButtonDemoVG(), MapDemoVG(), LocationDemoVG(), LoadImageDemoVG(), ControlsDemoVG(), ExampleContentVG(), ViewPagerDemoVG(stack), SegmentedControlDemoVG(), SliderDemoVG(), DateRangeDemoVG(), LoginDemoVG(stack), DrawableDemoVG(), PreviewVG()]
        self.options = options
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
