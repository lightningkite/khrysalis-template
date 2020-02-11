//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class MarginTestsVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Margin Tests"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MarginTestXml()
        var view = xml.setup(dependency)
        xml.scrollToTop.onClick(captureWeak(xml.scrollView) { (scrollView) in 
            scrollView.smoothScrollTo(0, 0)
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
