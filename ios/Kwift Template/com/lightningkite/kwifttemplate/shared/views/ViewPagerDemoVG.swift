//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class ViewPagerDemoVG: ViewGenerator {
    
    public var stack: ObservableStack<ViewGenerator>
    
    override public var title: String {
        get {
            return "View Pager Demo"
        }
    }
    public var items: Array<String>
    public var selectedIndex: StandardObservableProperty<Int32>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ViewPagerDemoXml()
        var view = xml.setup(dependency)
        xml.viewPager.bind(items, selectedIndex) { (it) in 
            var xml = RowTestXml()
            var view = xml.setup(dependency)
            xml.label.text = it
            return view
        }
        xml.viewPagerIndicator.bind(items.size, selectedIndex)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        let items: Array<String> = ["First", "Second", "Third"]
        self.items = items
        let selectedIndex: StandardObservableProperty<Int32> = StandardObservableProperty(0)
        self.selectedIndex = selectedIndex
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
