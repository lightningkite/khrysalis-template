//
// VideoDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly-web/dist/views/html'
import { customViewSetDelegate } from 'butterfly-web/dist/views/CustomView'
import htmlForDefault from './video_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.VideoDemoXml
export class VideoDemoXml {
    xmlRoot!: HTMLElement
    video!: HTMLVideoElement
    thumbnail!: HTMLImageElement
    play!: HTMLButtonElement
    gallery!: HTMLButtonElement
    camera!: HTMLButtonElement
    galleryMulti!: HTMLButtonElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.video = getViewById<HTMLVideoElement>(view, "video")
        this.thumbnail = getViewById<HTMLImageElement>(view, "thumbnail")
        this.play = getViewById<HTMLButtonElement>(view, "play")
        this.gallery = getViewById<HTMLButtonElement>(view, "gallery")
        this.camera = getViewById<HTMLButtonElement>(view, "camera")
        this.galleryMulti = getViewById<HTMLButtonElement>(view, "galleryMulti")
        return view
    }
}
