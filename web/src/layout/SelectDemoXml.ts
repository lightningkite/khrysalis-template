//
// SelectDemoXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './select_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.SelectDemoXml
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
