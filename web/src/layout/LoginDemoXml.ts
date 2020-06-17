//
// LoginDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './login_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.LoginDemoXml
export class LoginDemoXml {
    xmlRoot!: HTMLElement;
    username!: HTMLInputElement;
    password!: HTMLInputElement;
    verifyPassword!: HTMLInputElement;
    agree!: HTMLInputElement;
    submitLoading!: HTMLDivElement;
    submit!: HTMLButtonElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.username = getViewById<HTMLInputElement>(view, "username");
        this.password = getViewById<HTMLInputElement>(view, "password");
        this.verifyPassword = getViewById<HTMLInputElement>(view, "verifyPassword");
        this.agree = getViewById<HTMLInputElement>(view, "agree");
        this.submitLoading = getViewById<HTMLDivElement>(view, "submitLoading");
        this.submit = getViewById<HTMLButtonElement>(view, "submit");
        return view
    }
}
