//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift



public class SelectDemoVG: ViewGenerator {
    
    
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
            var xml = RowTestXml()
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
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        let options: Array<ViewGenerator> = [ControlsDemoVG(), ExampleContentVG(), ViewPagerDemoVG(stack), SegmentedControlDemoVG(), SliderDemoVG(), WeekDemoVG(), DateRangeDemoVG(), LoginDemoVG(stack), DrawableDemoVG(), PreviewVG()]
        self.options = options
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
