//
// MarginTestXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './margin_test.html'
//! Declares com.lightningkite.butterflytemplate.layouts.MarginTestXml
export class MarginTestXml {
    xmlRoot!: HTMLElement;
    scrollView!: HTMLDivElement;
    scrollToTop!: HTMLButtonElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.scrollView = getViewById<HTMLDivElement>(view, "scrollView");
        this.scrollToTop = getViewById<HTMLButtonElement>(view, "scrollToTop");
        return view
    }
}
