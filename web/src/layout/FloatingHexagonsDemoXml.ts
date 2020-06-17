//
// FloatingHexagonsDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import { FloatingHexagonsDelegate } from '../vg/FloatingHexagonsDemoVG.shared'
import htmlForDefault from './floating_hexagons_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.FloatingHexagonsDemoXml
export class FloatingHexagonsDemoXml {
    xmlRoot!: HTMLElement;
    customView!: HTMLCanvasElement;
    customViewDelegate!: FloatingHexagonsDelegate;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.customView = getViewById<HTMLCanvasElement>(view, "customView");
        if(this.customView){ this.customViewDelegate = new FloatingHexagonsDelegate(); customViewSetDelegate(this.customView, this.customViewDelegate); }
        return view
    }
}
