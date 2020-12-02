//
// MarginTestXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './margin_test.html'
//! Declares com.lightningkite.butterflytemplate.layouts.MarginTestXml
export class MarginTestXml {
    xmlRoot!: HTMLElement
    scrollView!: HTMLDivElement
    scrollToTop!: HTMLButtonElement
    focusTest!: HTMLInputElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.scrollView = getViewById<HTMLDivElement>(view, "scrollView")
        this.scrollToTop = getViewById<HTMLButtonElement>(view, "scrollToTop")
        this.focusTest = getViewById<HTMLInputElement>(view, "focusTest")
        return view
    }
}
