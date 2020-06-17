//
// HttpDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './http_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.HttpDemoXml
export class HttpDemoXml {
    xmlRoot!: HTMLElement;
    items!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.items = getViewById<HTMLDivElement>(view, "items");
        return view
    }
}
