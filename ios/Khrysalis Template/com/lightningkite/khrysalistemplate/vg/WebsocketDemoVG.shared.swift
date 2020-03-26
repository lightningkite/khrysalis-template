//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class WebsocketDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Websocket Demo"
        }
    }
    public var socket: Observable<ConnectedWebSocket>
    public var text: StandardObservableProperty<String>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = WebsocketDemoXml()
        var view = xml.setup(dependency)
        var itemsList = Array<WebSocketFrame>()
        xml.items.bind(data: socket.switchMap{ (it) in 
            it.read
        }.map{ (it) in 
            print("Adding item")
            itemsList.add(it)
            
            while itemsList.size > 20 {
                itemsList.removeAt(0)
            }
            return itemsList as! Array<WebSocketFrame>
        }.asObservableProperty(itemsList), defaultValue: WebSocketFrame(), makeView: { (observable) in 
            var cellXml = ComponentTextXml()
            var cellView = cellXml.setup(dependency)
            cellXml.label.bindString(observable.map{ (it) in 
                it.text ?? "---"
            })
            return cellView
        })
        xml.input.bindString(text)
        xml.submit.onClick{ () in 
            self.socket.take(1).subscribe{ (it) in 
                it.onNext(WebSocketFrame(text: self.text.value))
            }.until(xml.submit.removed)
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public func submitClick() -> Void {
    }
    
    override public init() {
        let socket: Observable<ConnectedWebSocket> = HttpClient.webSocket("wss://echo.websocket.org").replay(1).refCount()
        self.socket = socket
        let text: StandardObservableProperty<String> = StandardObservableProperty("")
        self.text = text
        super.init()
    }
}
 
