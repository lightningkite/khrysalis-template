//
// ControlsDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'butterfly/dist/views/html'
import { customViewSetDelegate } from 'butterfly/dist/views/CustomView'
import htmlForDefault from './controls_demo.html'
//! Declares com.lightningkite.butterflytemplate.layouts.ControlsDemoXml
export class ControlsDemoXml {
    xmlRoot!: HTMLElement;
    editableText!: HTMLInputElement;
    numberText!: HTMLInputElement;
    editableAutoText!: HTMLInputElement;
    editableTextCopy!: HTMLElement;
    editableTextBig!: HTMLTextAreaElement;
    spinner!: HTMLSelectElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.editableText = getViewById<HTMLInputElement>(view, "editableText");
        this.numberText = getViewById<HTMLInputElement>(view, "numberText");
        this.editableAutoText = getViewById<HTMLInputElement>(view, "editableAutoText");
        this.editableTextCopy = getViewById<HTMLElement>(view, "editableTextCopy");
        this.editableTextBig = getViewById<HTMLTextAreaElement>(view, "editableTextBig");
        this.spinner = getViewById<HTMLSelectElement>(view, "spinner");
        return view
    }
}
