//
// PreviewXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './preview.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.PreviewXml
export class PreviewXml {
    xmlRoot!: HTMLElement;
    viewName!: HTMLElement;
    pager!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.viewName = getViewById<HTMLElement>(view, "viewName");
        this.pager = getViewById<HTMLDivElement>(view, "pager");
        return view
    }
}
