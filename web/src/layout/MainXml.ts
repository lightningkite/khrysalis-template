//
// MainXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './main.html'
//! Declares com.lightningkite.butterflytemplate.layouts.MainXml
export class MainXml {
    xmlRoot!: HTMLElement;
    topBar!: HTMLDivElement;
    mainBack!: HTMLButtonElement;
    title!: HTMLElement;
    mainContent!: HTMLDivElement;
    bottom0!: HTMLElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.topBar = getViewById<HTMLDivElement>(view, "topBar");
        this.mainBack = getViewById<HTMLButtonElement>(view, "mainBack");
        this.title = getViewById<HTMLElement>(view, "title");
        this.mainContent = getViewById<HTMLDivElement>(view, "mainContent");
        this.bottom0 = getViewById<HTMLElement>(view, "bottom0");
        return view
    }
}
