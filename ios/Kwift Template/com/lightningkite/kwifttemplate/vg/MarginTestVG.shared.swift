//Package: com.lightningkite.kwifttemplate.vg
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class MarginTestsVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Margin Tests"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MarginTestXml()
        var view = xml.setup(dependency)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
