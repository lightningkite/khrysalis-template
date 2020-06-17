//
// DateRangeDemoXml.ts
// Created by Khrysalis XML Typescript
//
import { loadHtmlFromString, findViewById, getViewById, replaceViewWithId } from 'khrysalis/dist/views/html'
import { customViewSetDelegate } from 'khrysalis/dist/views/CustomView.actual'
import { MonthCVD } from 'khrysalis/dist/views/MonthCVD.shared'
import { SelectDateMonthCVD } from 'khrysalis/dist/views/SelectDateMonthCVD.shared'
import { SelectDateRangeMonthCVD } from 'khrysalis/dist/views/SelectDateRangeMonthCVD.shared'
import { SelectMultipleDatesMonthCVD } from 'khrysalis/dist/views/SelectMultipleDatesMonthCVD.shared'
import htmlForDefault from './date_range_demo.html'
//! Declares com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml
export class DateRangeDemoXml {
    xmlRoot!: HTMLElement;
    month!: HTMLCanvasElement;
    month2!: HTMLCanvasElement;
    month3!: HTMLCanvasElement;
    month4!: HTMLCanvasElement;
    monthDelegate!: MonthCVD;
    month2Delegate!: SelectDateMonthCVD;
    month3Delegate!: SelectDateRangeMonthCVD;
    month4Delegate!: SelectMultipleDatesMonthCVD;
    loadHtmlString(): string {
        return htmlForDefault;
    }
    setup(dependency: Window): HTMLElement {
        const view = loadHtmlFromString(this.loadHtmlString());
        this.xmlRoot = view
        this.month = getViewById<HTMLCanvasElement>(view, "month");
        this.month2 = getViewById<HTMLCanvasElement>(view, "month2");
        this.month3 = getViewById<HTMLCanvasElement>(view, "month3");
        this.month4 = getViewById<HTMLCanvasElement>(view, "month4");
        if(this.month){ this.monthDelegate = new MonthCVD(); customViewSetDelegate(this.month, this.monthDelegate); }
        if(this.month2){ this.month2Delegate = new SelectDateMonthCVD(); customViewSetDelegate(this.month2, this.month2Delegate); }
        if(this.month3){ this.month3Delegate = new SelectDateRangeMonthCVD(); customViewSetDelegate(this.month3, this.month3Delegate); }
        if(this.month4){ this.month4Delegate = new SelectMultipleDatesMonthCVD(); customViewSetDelegate(this.month4, this.month4Delegate); }
        return view
    }
}
