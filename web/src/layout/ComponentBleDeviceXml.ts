//
// ComponentBleDeviceXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import htmlForDefault from './component_ble_device.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.ComponentBleDeviceXml
export class ComponentBleDeviceXml {
    xmlRoot!: HTMLElement;
    deviceName!: HTMLElement;
    deviceId!: HTMLElement;
    rssi!: HTMLElement;
    connect!: HTMLButtonElement;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.deviceName = getViewById<HTMLElement>(view, "deviceName");
        this.deviceId = getViewById<HTMLElement>(view, "deviceId");
        this.rssi = getViewById<HTMLElement>(view, "rssi");
        this.connect = getViewById<HTMLButtonElement>(view, "connect");
        return view
    }
}
