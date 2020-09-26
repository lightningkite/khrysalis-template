//
// ComponentTextXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './component_text.html'
//! Declares com.lightningkite.butterflytemplate.layouts.ComponentTextXml
export class ComponentTextXml {
    xmlRoot!: HTMLElement;
    label!: HTMLElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.label = getViewById<HTMLElement>(view, "label");
        return view
    }
}
