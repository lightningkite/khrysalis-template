//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class ControlsDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Controls Demo"
        }
    }
    public var text: StandardObservableProperty<String>
    public var options: StandardObservableProperty<Array<String>>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ControlsDemoXml()
        var view = xml.setup(dependency)
        xml.editableText.bindString(text)
        xml.editableAutoText.bindString(text)
        xml.editableAutoText.bind(options: options, toString: { (it) in 
            it
        }, onItemSelected: { (item) in 
            self.text.value = item
        })
        xml.editableTextCopy.bindString(text)
        xml.editableTextBig.bindString(text)
        xml.spinner.bind(options: options, selected: text, makeView: { (obs) in 
            var xml = RowTextXml()
            var view = xml.setup(dependency)
            xml.label.bindString(obs)
            return view
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let text: StandardObservableProperty<String> = StandardObservableProperty("")
        self.text = text
        let options: StandardObservableProperty<Array<String>> = StandardObservableProperty(["Apple", "Banana", "Chili Pepper", "Dragon Fruit"])
        self.options = options
        super.init()
    }
}
 
