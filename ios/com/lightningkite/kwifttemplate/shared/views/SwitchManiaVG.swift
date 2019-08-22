//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation



public class SwitchManiaVG: ViewGenerator {
    
    public var stack: ObservableStack<ViewGenerator>
    
    override public var title: String {
        get {
            return "Switch Mania!"
        }
    }
    public var text: StandardObservableProperty<String>
    public var options: StandardObservableProperty<Array<String>>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = SwitchManiaXml()
        var view = xml.setup(dependency)
        xml.editableText.bindString(text)
        xml.editableTextCopy.bindString(text)
        xml.spinner.bind(options: options, selected: text, makeView: { (obs) in 
            var xml = RowTextXml()
            var view = xml.setup(dependency)
            xml.label.bindString(obs)
            return view
        })
        xml.recyclerView.bind(data: options, defaultValue: "Default", makeView: { (obs) in 
            var xml = RowTestXml()
            var view = xml.setup(dependency)
            xml.label.bindString(obs)
            xml.button.onClick(captureWeak(self) { (self) in 
                self.text .value = obs.value
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
        self.text = StandardObservableProperty("")
        self.options = StandardObservableProperty(["A", "B", "C", "D"])
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
