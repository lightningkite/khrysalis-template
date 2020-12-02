//
// ExternalTestXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId, startupAutoResize } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './external_test.html'
//! Declares com.lightningkite.butterflytemplate.layouts.ExternalTestXml
export class ExternalTestXml {
    xmlRoot!: HTMLElement
    scrollView!: HTMLDivElement
    openMap!: HTMLButtonElement
    openWeb!: HTMLButtonElement
    openEvent!: HTMLButtonElement
    pickImage!: HTMLButtonElement
    pickImages!: HTMLButtonElement
    pickVideo!: HTMLButtonElement
    pickVideos!: HTMLButtonElement
    pickMedia!: HTMLButtonElement
    pickMedias!: HTMLButtonElement
    pickFile!: HTMLButtonElement
    pickFiles!: HTMLButtonElement
    loadHtmlString(): string {
        return htmlForDefault
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString())
        this.xmlRoot = view
        this.scrollView = getViewById<HTMLDivElement>(view, "scrollView")
        this.openMap = getViewById<HTMLButtonElement>(view, "openMap")
        this.openWeb = getViewById<HTMLButtonElement>(view, "openWeb")
        this.openEvent = getViewById<HTMLButtonElement>(view, "openEvent")
        this.pickImage = getViewById<HTMLButtonElement>(view, "pick_image")
        this.pickImages = getViewById<HTMLButtonElement>(view, "pick_images")
        this.pickVideo = getViewById<HTMLButtonElement>(view, "pick_video")
        this.pickVideos = getViewById<HTMLButtonElement>(view, "pick_videos")
        this.pickMedia = getViewById<HTMLButtonElement>(view, "pick_media")
        this.pickMedias = getViewById<HTMLButtonElement>(view, "pick_medias")
        this.pickFile = getViewById<HTMLButtonElement>(view, "pick_file")
        this.pickFiles = getViewById<HTMLButtonElement>(view, "pick_files")
        return view
    }
}
