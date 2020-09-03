// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/HttpDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { xObservableAsObservableProperty } from 'khrysalis/dist/observables/EventToObservableProperty.shared'
import { HttpDemoXml } from '../layout/HttpDemoXml'
import { HttpProgress } from 'khrysalis/dist/net/HttpModels.shared'
import { ObservableProperty } from 'khrysalis/dist/observables/ObservableProperty.shared'
import { xProgressBarBindFloat } from 'khrysalis/dist/observables/binding/ProgressBar.binding.actual'
import { ComponentTextXml } from '../layout/ComponentTextXml'
import { hashAnything, safeEq } from 'khrysalis/dist/Kotlin'
import { xSingleReadJson } from 'khrysalis/dist/net/RxHttpAssist.actual'
import { parse as parseJsonTyped } from 'khrysalis/dist/net/jsonParsing'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { xTextViewBindString } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { HttpClient } from 'khrysalis/dist/net/HttpClient.actual'
import { xObservablePropertyMap } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'
import { xRecyclerViewBind } from 'khrysalis/dist/observables/binding/RecyclerView.binding.actual'

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
        
        
        //--- Call
        const pair = HttpClient.INSTANCE.callWithProgress("https://jsonplaceholder.typicode.com/posts/", undefined, undefined, undefined, undefined);
        
        const progress = pair[0];
        
        const call = pair[1];
        
        
        //--- Set Up xml.progress
        xProgressBarBindFloat(xml.progress, xObservablePropertyMap<HttpProgress, number>(progress, (it: HttpProgress): number => it.approximate));
        
        //--- Set Up xml.items
        xRecyclerViewBind<HttpDemoVG.Post>(xml.items, xObservableAsObservableProperty<Array<HttpDemoVG.Post>>(xSingleReadJson<Array<HttpDemoVG.Post>>(call, [Array, [HttpDemoVG.Post]]), [new HttpDemoVG.Post(0, 0, "Loading...", "-")]), new HttpDemoVG.Post(0, 0, "Default", "Failure"), (observable: ObservableProperty<HttpDemoVG.Post>): HTMLElement => {
                //--- Make Subview For xml.items
                const cellXml = new ComponentTextXml();
                
                const cellView = cellXml.setup(dependency);
                
                
                //--- Set Up cellXml.label
                xTextViewBindString(cellXml.label, xObservablePropertyMap<HttpDemoVG.Post, string>(observable, (it: HttpDemoVG.Post): string => it.title));
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
    export class Post {
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
        public toJSON(): object { return {
                userId: this.userId, 
                id: this.id, 
                title: this.title, 
                body: this.body
        } }
        public hashCode(): number {
            let hash = 17;
            hash = 31 * hash + hashAnything(this.userId);
            hash = 31 * hash + hashAnything(this.id);
            hash = 31 * hash + hashAnything(this.title);
            hash = 31 * hash + hashAnything(this.body);
            return hash;
        }
        public equals(other: any): boolean { return other instanceof Post && safeEq(this.userId, other.userId) && safeEq(this.id, other.id) && safeEq(this.title, other.title) && safeEq(this.body, other.body) }
        public toString(): string { return `Post(userId = ${this.userId}, id = ${this.id}, title = ${this.title}, body = ${this.body})` }
        public copy(userId: number = this.userId, id: number = this.id, title: string = this.title, body: string = this.body): Post { return new Post(userId, id, title, body); }
    }
}

