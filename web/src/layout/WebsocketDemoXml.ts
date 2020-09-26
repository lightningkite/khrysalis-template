//
// WebsocketDemoXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './websocket_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.WebsocketDemoXml
export class WebsocketDemoXml {
    xmlRoot!: HTMLElement;
    items!: HTMLDivElement;
    input!: HTMLInputElement;
    submit!: HTMLButtonElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.items = getViewById<HTMLDivElement>(view, "items");
        this.input = getViewById<HTMLInputElement>(view, "input");
        this.submit = getViewById<HTMLButtonElement>(view, "submit");
        return view
    }
}
