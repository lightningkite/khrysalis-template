//
// SelectDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly-web/dist/views/html'
import { customViewSetDelegate } from 'butterfly-web/dist/views/CustomView'
import htmlForDefault from './select_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.SelectDemoXml
export class SelectDemoXml {
    xmlRoot!: HTMLElement
    list!: HTMLDivElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.list = getViewById<HTMLDivElement>(view, "list")
        return view
    }
}
