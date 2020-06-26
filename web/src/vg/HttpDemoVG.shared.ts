// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/HttpDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { hashString } from 'khrysalis/dist/Kotlin'
import { ComponentTextXml } from '../layout/ComponentTextXml'
import { ioReactivexObservableAsObservableProperty } from 'khrysalis/dist/observables/EventToObservableProperty.shared'
import { parse as parseJsonTyped } from 'khrysalis/dist/net/jsonParsing'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { comLightningkiteKhrysalisObservablesObservablePropertyMap } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'
import { androidWidgetTextViewBindString } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { ioReactivexSingleReadJson } from 'khrysalis/dist/net/RxHttpAssist.actual'
import { Codable } from 'khrysalis/dist/Codable.actual'
import { HttpClient } from 'khrysalis/dist/net/HttpClient.actual'
import { HttpDemoXml } from '../layout/HttpDemoXml'
import { androidxRecyclerviewWidgetRecyclerViewBind } from 'khrysalis/dist/observables/binding/RecyclerView.binding.actual'

//! Declares com.lightningkite.khrysalistemplate.vg.HttpDemoVG
export class HttpDemoVG extends ViewGenerator {
    public constructor() {
        super();
    }
    
    
    
    //! Declares com.lightningkite.khrysalistemplate.vg.HttpDemoVG.title
    public get title(): string { return "Http Demo"; }
    
    
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new HttpDemoXml();
        
        const view = xml.setup(dependency);
        
        
        //--- Set Up xml.items
        androidxRecyclerviewWidgetRecyclerViewBind(xml.items, ioReactivexObservableAsObservableProperty(ioReactivexSingleReadJson(HttpClient.INSTANCE.call("https://jsonplaceholder.typicode.com/posts/", undefined, undefined, undefined), [Array, [HttpDemoVG.Post]]), [new HttpDemoVG.Post(0, 0, "Loading...", "-")]), new HttpDemoVG.Post(0, 0, "Default", "Failure"), (observable) => {
                //--- Make Subview For xml.items
                const cellXml = new ComponentTextXml();
                
                const cellView = cellXml.setup(dependency);
                
                
                //--- Set Up cellXml.label
                androidWidgetTextViewBindString(cellXml.label, comLightningkiteKhrysalisObservablesObservablePropertyMap(observable, (it) => it.title));
                //--- End Make Subview For xml.items
                return cellView;
        });
        
        //--- Generate End (overwritten on flow generation)
        
        return view;
    }
    
    //--- Init
    
    
    
    //--- Actions
    
    
    //--- Body End
}
export namespace HttpDemoVG {
    //! Declares com.lightningkite.khrysalistemplate.vg.HttpDemoVG.Post
    export class Post implements Codable {
        public static implementsInterfaceComLightningkiteKhrysalisCodable = true;
        public readonly userId: number;
        public readonly id: number;
        public readonly title: string;
        public readonly body: string;
        public constructor(userId: number, id: number, title: string, body: string) {
            this.userId = userId;
            this.id = id;
            this.title = title;
            this.body = body;
        }
        public static fromJson(obj: any): Post { return new Post(
                parseJsonTyped(obj["userId"], [Number]) as number, 
                parseJsonTyped(obj["id"], [Number]) as number, 
                parseJsonTyped(obj["title"], [String]) as string, 
                parseJsonTyped(obj["body"], [String]) as string
        ) }
        public toJson(): object { return {
                userId: this.userId, 
                id: this.id, 
                title: this.title, 
                body: this.body
        } }
        public hashCode(): number {
            let hash = 17;
            hash = 31 * hash + this.userId;
            hash = 31 * hash + this.id;
            hash = 31 * hash + hashString(this.title);
            hash = 31 * hash + hashString(this.body);
            return hash;
        }
        public equals(other: any): boolean { return other instanceof Post && this.userId === other.userId && this.id === other.id && this.title === other.title && this.body === other.body }
        public toString(): string { return `Post(userId = ${this.userId}, id = ${this.id}, title = ${this.title}, body = ${this.body})` }
        public copy(userId: number = this.userId, id: number = this.id, title: string = this.title, body: string = this.body) { return new Post(userId, id, title, body); }
    }
}

