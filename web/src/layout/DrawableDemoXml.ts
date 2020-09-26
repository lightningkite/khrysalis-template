//
// DrawableDemoXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './drawable_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.DrawableDemoXml
export class DrawableDemoXml {
    xmlRoot!: HTMLElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        return view
    }
}
