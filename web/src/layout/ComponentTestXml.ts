//
// ComponentTestXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly-web/dist/views/html'
import { customViewSetDelegate } from 'butterfly-web/dist/views/CustomView'
import htmlForDefault from './component_test.html'
//! Declares com.lightningkite.butterflytemplate.layouts.ComponentTestXml
export class ComponentTestXml {
    xmlRoot!: HTMLElement
    label!: HTMLElement
    button!: HTMLButtonElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.label = getViewById<HTMLElement>(view, "label")
        this.button = getViewById<HTMLButtonElement>(view, "button")
        return view
    }
}
