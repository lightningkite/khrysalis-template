//
// SegmentedControlDemoXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './segmented_control_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.SegmentedControlDemoXml
export class SegmentedControlDemoXml {
    xmlRoot!: HTMLElement;
    tabs!: HTMLDivElement;
    tabs2!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.tabs = getViewById<HTMLDivElement>(view, "tabs");
        this.tabs2 = getViewById<HTMLDivElement>(view, "tabs2");
        return view
    }
}
