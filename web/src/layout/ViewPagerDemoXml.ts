//
// ViewPagerDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './view_pager_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.ViewPagerDemoXml
export class ViewPagerDemoXml {
    xmlRoot!: HTMLElement;
    viewPager!: HTMLDivElement;
    viewPagerIndicator!: HTMLDivElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.viewPager = getViewById<HTMLDivElement>(view, "viewPager");
        this.viewPagerIndicator = getViewById<HTMLDivElement>(view, "viewPagerIndicator");
        return view
    }
}
