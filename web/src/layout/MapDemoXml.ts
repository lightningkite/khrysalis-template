//
// MapDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './map_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.MapDemoXml
export class MapDemoXml {
    xmlRoot!: HTMLElement;
    map!: HTMLDivElement;
    select!: HTMLInputElement;
    options!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.map = getViewById<HTMLDivElement>(view, "map");
        this.select = getViewById<HTMLInputElement>(view, "select");
        this.options = getViewById<HTMLDivElement>(view, "options");
        return view
    }
}
