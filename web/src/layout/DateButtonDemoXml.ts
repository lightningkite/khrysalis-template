//
// DateButtonDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly-web/dist/views/html'
import { customViewSetDelegate } from 'butterfly-web/dist/views/CustomView'
import htmlForDefault from './date_button_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.DateButtonDemoXml
export class DateButtonDemoXml {
    xmlRoot!: HTMLElement
    text!: HTMLElement
    dateButton!: HTMLInputElement
    timeButton!: HTMLInputElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.text = getViewById<HTMLElement>(view, "text")
        this.dateButton = getViewById<HTMLInputElement>(view, "dateButton")
        this.timeButton = getViewById<HTMLInputElement>(view, "timeButton")
        return view
    }
}
