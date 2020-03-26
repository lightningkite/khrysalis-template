//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class MultipleDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Multiple List Demo"
        }
    }
    public var data: Array<Any>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = MultipleDemoXml()
        var view = xml.setup(dependency)
        xml.list.bindMulti(viewDependency: dependency, data: ConstantObservableProperty(data), typeHandlerSetup: { (handler) in 
            handler.handle(0.toInt()){ (obs) in 
                var cellXml = ComponentTestXml()
                var cellView = cellXml.setup(dependency)
                cellXml.label.bindString(obs.map{ (it) in 
                    "The number \(it)"
                })
                return cellView
            }
            handler.handle(""){ (obs) in 
                var cellXml = ComponentTestXml()
                var cellView = cellXml.setup(dependency)
                cellXml.label.bindString(obs.map{ (it) in 
                    "The string '\(it)'"
                })
                return cellView
            }
            handler.handle(()){ (obs) in 
                var cellXml = ComponentTextXml()
                var cellView = cellXml.setup(dependency)
                cellXml.label.text = "-----"
                return cellView
            }
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let data: Array<Any> = [1.toInt(), 2.toInt(), "3", 4.toInt(), "5", (), "Test", 6.toInt()] as! Array<Any>
        self.data = data
        super.init()
    }
}
 
