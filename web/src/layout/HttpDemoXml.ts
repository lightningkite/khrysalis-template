//
// HttpDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './http_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.HttpDemoXml
export class HttpDemoXml {
    xmlRoot!: HTMLElement;
    progress!: HTMLProgressElement;
    items!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.progress = getViewById<HTMLProgressElement>(view, "progress");
        this.items = getViewById<HTMLDivElement>(view, "items");
        return view
    }
}
