//
// LoadImageDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './load_image_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.LoadImageDemoXml
export class LoadImageDemoXml {
    xmlRoot!: HTMLElement;
    gallery!: HTMLButtonElement;
    galleryMultiple!: HTMLButtonElement;
    camera!: HTMLButtonElement;
    loremPixel!: HTMLButtonElement;
    image!: HTMLImageElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.gallery = getViewById<HTMLButtonElement>(view, "gallery");
        this.galleryMultiple = getViewById<HTMLButtonElement>(view, "galleryMultiple");
        this.camera = getViewById<HTMLButtonElement>(view, "camera");
        this.loremPixel = getViewById<HTMLButtonElement>(view, "lorem_pixel");
        this.image = getViewById<HTMLImageElement>(view, "image");
        return view
    }
}
