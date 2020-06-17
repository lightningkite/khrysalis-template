//
// SliderDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './slider_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.SliderDemoXml
export class SliderDemoXml {
    xmlRoot!: HTMLElement;
    slider!: HTMLInputElement;
    valueDisplay!: HTMLElement;
    rating!: HTMLDivElement;
    ratingDisplayStars!: HTMLDivElement;
    ratingDisplayStarsSmall!: HTMLDivElement;
    ratingDisplayNumber!: HTMLElement;
    ratingFloat!: HTMLDivElement;
    ratingDisplayStarsFloat!: HTMLDivElement;
    ratingDisplayStarsSmallFloat!: HTMLDivElement;
    ratingDisplayNumberFloat!: HTMLElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.slider = getViewById<HTMLInputElement>(view, "slider");
        this.valueDisplay = getViewById<HTMLElement>(view, "valueDisplay");
        this.rating = getViewById<HTMLDivElement>(view, "rating");
        this.ratingDisplayStars = getViewById<HTMLDivElement>(view, "ratingDisplayStars");
        this.ratingDisplayStarsSmall = getViewById<HTMLDivElement>(view, "ratingDisplayStarsSmall");
        this.ratingDisplayNumber = getViewById<HTMLElement>(view, "ratingDisplayNumber");
        this.ratingFloat = getViewById<HTMLDivElement>(view, "ratingFloat");
        this.ratingDisplayStarsFloat = getViewById<HTMLDivElement>(view, "ratingDisplayStarsFloat");
        this.ratingDisplayStarsSmallFloat = getViewById<HTMLDivElement>(view, "ratingDisplayStarsSmallFloat");
        this.ratingDisplayNumberFloat = getViewById<HTMLElement>(view, "ratingDisplayNumberFloat");
        return view
    }
}
