//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class PreviewVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Preview"
        }
    }
    
    public class XmlPreview {
        
        public var name: String
        public var make:  (ViewDependency) -> View
        
        
        public init(name: String, make: @escaping (ViewDependency) -> View) {
            self.name = name
            self.make = make
        }
        convenience public init(_ name: String, _ make: @escaping (ViewDependency) -> View) {
            self.init(name: name, make: make)
        }
    }
    public var previews: Array<XmlPreview>
    public var previewIndex: StandardObservableProperty<Int32>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = PreviewXml()
        var view = xml.setup(dependency)
        xml.pager.bind(previews, previewIndex) { (it) in 
            it.make(dependency)
        }
        previewIndex.addAndRunWeak(self, xml.viewName) { (self, view, it) in 
            view.text = self.previews[ it ].name
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let previews: Array<XmlPreview> = [XmlPreview("ControlsDemoXml") { (it) in 
            ControlsDemoXml().setup(it)
        }, XmlPreview("DateRangeDemoXml") { (it) in 
            DateRangeDemoXml().setup(it)
        }, XmlPreview("ExampleContentXml") { (it) in 
            ExampleContentXml().setup(it)
        }, XmlPreview("LoginDemoXml") { (it) in 
            LoginDemoXml().setup(it)
        }, XmlPreview("MainXml") { (it) in 
            MainXml().setup(it)
        }, XmlPreview("SegmentedControlDemoXml") { (it) in 
            SegmentedControlDemoXml().setup(it)
        }, XmlPreview("SelectDemoXml") { (it) in 
            SelectDemoXml().setup(it)
        }, XmlPreview("SliderDemoXml") { (it) in 
            SliderDemoXml().setup(it)
        }, XmlPreview("ViewPagerDemoXml") { (it) in 
            ViewPagerDemoXml().setup(it)
        }]
        self.previews = previews
        let previewIndex: StandardObservableProperty<Int32> = StandardObservableProperty(0)
        self.previewIndex = previewIndex
        super.init()
    }
}
 
