// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/WebsocketDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { map as rxMap, publishReplay as rxPublishReplay, refCount as rxRefCount, switchMap as rxSwitchMap, take as rxTake } from 'rxjs/operators'
import { androidWidgetEditTextBindString } from 'khrysalis/dist/observables/binding/EditText.binding.actual'
import { WebSocketFrame } from 'khrysalis/dist/net/WebSocketFrame.actual'
import { comLightningkiteKhrysalisObservablesObservablePropertyMap } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'
import { Observable } from 'rxjs'
import { getAndroidViewViewRemoved, ioReactivexDisposablesDisposableUntil } from 'khrysalis/dist/rx/DisposeCondition.actual'
import { WebsocketDemoXml } from '../layout/WebsocketDemoXml'
import { ComponentTextXml } from '../layout/ComponentTextXml'
import { StandardObservableProperty } from 'khrysalis/dist/observables/StandardObservableProperty.shared'
import { ioReactivexObservableAsObservableProperty } from 'khrysalis/dist/observables/EventToObservableProperty.shared'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { ConnectedWebSocket } from 'khrysalis/dist/net/ConnectedWebSocket.actual'
import { androidWidgetTextViewBindString } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { HttpClient } from 'khrysalis/dist/net/HttpClient.actual'
import { androidxRecyclerviewWidgetRecyclerViewBind } from 'khrysalis/dist/observables/binding/RecyclerView.binding.actual'

//! Declares com.lightningkite.khrysalistemplate.vg.WebsocketDemoVG
export class WebsocketDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.socket = HttpClient.INSTANCE.webSocket("wss://echo.websocket.org").pipe(rxPublishReplay(1)).pipe(rxRefCount());
        this.text = new StandardObservableProperty("", undefined);
    }
    
    
    
    //! Declares com.lightningkite.khrysalistemplate.vg.WebsocketDemoVG.title
    public get title(): string { return "Websocket Demo"; }
    
    
    public readonly socket: Observable<ConnectedWebSocket>;
    
    public readonly text: StandardObservableProperty<string>;
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new WebsocketDemoXml();
        
        const view = xml.setup(dependency);
        
        
        //--- Set Up xml.items
        const itemsList = [] as Array<WebSocketFrame>;
        
        androidxRecyclerviewWidgetRecyclerViewBind(xml.items, ioReactivexObservableAsObservableProperty(this.socket.pipe(rxSwitchMap((it) => it.read)).pipe(rxMap((it) => {
                            console.log("Adding item");
                            itemsList.push(it);
                            while (itemsList.length > 20) {
                                itemsList.splice(0, 1);
                            }
                            return itemsList as Array<WebSocketFrame>;
            })), itemsList), new WebSocketFrame(undefined, undefined), (observable) => {
                //--- Make Subview For xml.items (overwritten on flow generation)
                const cellXml = new ComponentTextXml();
                
                const cellView = cellXml.setup(dependency);
                
                
                //--- Set Up cellXml.label (overwritten on flow generation)
                androidWidgetTextViewBindString(cellXml.label, comLightningkiteKhrysalisObservablesObservablePropertyMap(observable, (it) => it.text ?? "---"));
                //--- End Make Subview For xml.items (overwritten on flow generation)
                return cellView;
        });
        
        //--- Set Up xml.input
        androidWidgetEditTextBindString(xml.input, this.text);
        
        //--- Set Up xml.submit
        xml.submit.onclick = (_ev) => { _ev.stopPropagation(); 
            ioReactivexDisposablesDisposableUntil(this.socket.pipe(rxTake(1)).subscribe((it) => {
                        it.next(new WebSocketFrame(undefined, this.text.value))
            }, undefined, undefined), getAndroidViewViewRemoved(xml.submit));
        };
        
        //--- Generate End (overwritten on flow generation)
        
        return view;
    }
    
    //--- Init
    
    
    
    //--- Actions
    
    
    public submitClick(): void {
    }
    
    //--- Body End
}

