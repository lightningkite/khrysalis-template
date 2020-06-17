//
// SelectDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './select_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.SelectDemoXml
export class SelectDemoXml {
    xmlRoot!: HTMLElement;
    list!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.list = getViewById<HTMLDivElement>(view, "list");
        return view
    }
}
