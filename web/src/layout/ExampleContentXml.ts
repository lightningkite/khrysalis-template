//
// ExampleContentXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './example_content.html'
//! Declares com.lightningkite.butterflytemplate.layouts.ExampleContentXml
export class ExampleContentXml {
    xmlRoot!: HTMLElement;
    scrollView!: HTMLDivElement;
    exampleContentNumber!: HTMLElement;
    exampleContentIncrement!: HTMLButtonElement;
    chainedNumber!: HTMLElement;
    chainedIncrement!: HTMLButtonElement;
    scrollToTop!: HTMLButtonElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.scrollView = getViewById<HTMLDivElement>(view, "scrollView");
        this.exampleContentNumber = getViewById<HTMLElement>(view, "exampleContentNumber");
        this.exampleContentIncrement = getViewById<HTMLButtonElement>(view, "exampleContentIncrement");
        this.chainedNumber = getViewById<HTMLElement>(view, "chainedNumber");
        this.chainedIncrement = getViewById<HTMLButtonElement>(view, "chainedIncrement");
        this.scrollToTop = getViewById<HTMLButtonElement>(view, "scrollToTop");
        return view
    }
}
