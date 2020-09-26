//
// ExternalTestXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './external_test.html'
//! Declares com.lightningkite.butterflytemplate.layouts.ExternalTestXml
export class ExternalTestXml {
    xmlRoot!: HTMLElement;
    scrollView!: HTMLDivElement;
    openMap!: HTMLButtonElement;
    openWeb!: HTMLButtonElement;
    openEvent!: HTMLButtonElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.scrollView = getViewById<HTMLDivElement>(view, "scrollView");
        this.openMap = getViewById<HTMLButtonElement>(view, "openMap");
        this.openWeb = getViewById<HTMLButtonElement>(view, "openWeb");
        this.openEvent = getViewById<HTMLButtonElement>(view, "openEvent");
        return view
    }
}
