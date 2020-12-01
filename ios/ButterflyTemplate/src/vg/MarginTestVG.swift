// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: vg/MarginTestVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import Butterfly
import Foundation

public class MarginTestsVG : ViewGenerator {
    override public init() {
        super.init()
        //Necessary properties should be initialized now
    }
    
    override public var title: String {
        get { return "Margin Tests" }
    }
    
    override public func generate(dependency: ViewControllerAccess) -> UIView {
        let xml = MarginTestXml()
        let view = xml.setup(dependency: dependency)
        xml.scrollToTop.onClick(action: { () -> Void in xml.scrollView.smoothScrollTo(0, 0) })
        return view
    }
}

