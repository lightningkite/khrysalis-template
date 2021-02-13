//
// LoadImageDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly-web/dist/views/html'
import { customViewSetDelegate } from 'butterfly-web/dist/views/CustomView'
import htmlForDefault from './load_image_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.LoadImageDemoXml
export class LoadImageDemoXml {
    xmlRoot!: HTMLElement
    gallery!: HTMLButtonElement
    galleryMultiple!: HTMLButtonElement
    camera!: HTMLButtonElement
    loremPixel!: HTMLButtonElement
    image!: HTMLImageElement
    checkCanUpload!: HTMLButtonElement
    canUpload!: HTMLElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.gallery = getViewById<HTMLButtonElement>(view, "gallery")
        this.galleryMultiple = getViewById<HTMLButtonElement>(view, "galleryMultiple")
        this.camera = getViewById<HTMLButtonElement>(view, "camera")
        this.loremPixel = getViewById<HTMLButtonElement>(view, "lorem_pixel")
        this.image = getViewById<HTMLImageElement>(view, "image")
        this.checkCanUpload = getViewById<HTMLButtonElement>(view, "checkCanUpload")
        this.canUpload = getViewById<HTMLElement>(view, "canUpload")
        return view
    }
}
