//
// PongDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import { PongDelegate } from '../vg/PongDemoVG'
import htmlForDefault from './pong_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.PongDemoXml
export class PongDemoXml {
    xmlRoot!: HTMLElement
    customView!: HTMLCanvasElement
    customViewDelegate!: PongDelegate
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.customView = getViewById<HTMLCanvasElement>(view, "customView")
        if(this.customView){ this.customViewDelegate = new PongDelegate(); customViewSetDelegate(this.customView, this.customViewDelegate); }
        return view
    }
}
