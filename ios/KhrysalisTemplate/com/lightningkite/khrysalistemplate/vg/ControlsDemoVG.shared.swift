//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class ControlsDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Controls Demo"
        }
    }
    public var text: StandardObservableProperty<String>
    public var options: StandardObservableProperty<Array<String>>
    public var number: StandardObservableProperty<Int32>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = ControlsDemoXml()
        var view = xml.setup(dependency)
        xml.numberText.bindInteger(number)
        xml.editableText.bindString(text.combine(number){ (t, n) in 
            "\(t) (\(n))"
        })
        xml.editableAutoText.bindString(text)
        xml.editableAutoText.bind(options: options, toString: { (it) in 
            it
        }, onItemSelected: { (item) in 
            self.text.value = item
        })
        xml.editableTextCopy.bindString(text)
        xml.editableTextBig.bindString(text)
        xml.spinner.bind(options: options, selected: text, makeView: { (obs) in 
            var xml = ComponentTestXml()
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
        let number: StandardObservableProperty<Int32> = StandardObservableProperty(32)
        self.number = number
        super.init()
    }
}
 
