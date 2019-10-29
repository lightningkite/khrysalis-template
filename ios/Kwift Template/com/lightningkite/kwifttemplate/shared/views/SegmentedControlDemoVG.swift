//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class SegmentedControlDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Segmented Control Demo"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = SegmentedControlDemoXml()
        var view = xml.setup(dependency)
        xml.tabs.bind(["A", "B", "C"], StandardObservableProperty(0))
        xml.tabs2.bind(["A", "B", "C", "D", "E", "F", "G"], StandardObservableProperty(0))
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
