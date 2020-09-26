//
// LocationDemoXml.ts
// Created by Butterfly XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView.actual'
import htmlForDefault from './location_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.LocationDemoXml
export class LocationDemoXml {
    xmlRoot!: HTMLElement;
    getLocation!: HTMLButtonElement;
    locationDisplay!: HTMLElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.getLocation = getViewById<HTMLButtonElement>(view, "get_location");
        this.locationDisplay = getViewById<HTMLElement>(view, "location_display");
        return view
    }
}
