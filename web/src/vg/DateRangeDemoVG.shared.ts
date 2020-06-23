// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/DateRangeDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
// FQImport: java.util.Date TS Date
// FQImport: com.lightningkite.khrysalistemplate.vg.DateRangeDemoVG.generate.dependency TS dependency
// FQImport: com.lightningkite.khrysalistemplate.vg.DateRangeDemoVG.generate.xml TS xml
// FQImport: com.lightningkite.khrysalis.views.SelectMultipleDatesMonthCVD.selectedPaint TS selectedPaint
// FQImport: android.graphics.Paint.color TS color
// FQImport: com.lightningkite.khrysalis.views.SelectMultipleDatesMonthCVD.selectedDayPaint TS selectedDayPaint
// FQImport: com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml.month4Delegate TS month4Delegate
// FQImport: com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml TS DateRangeDemoXml
// FQImport: com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml.month3Delegate TS month3Delegate
// FQImport: com.lightningkite.khrysalistemplate.vg.DateRangeDemoVG.generate.view TS view
// FQImport: com.lightningkite.khrysalis.views.ViewGenerator TS ViewGenerator
// FQImport: com.lightningkite.khrysalis.views.SelectDateRangeMonthCVD.selectedDayPaint TS selectedDayPaint
// FQImport: kotlin.collections.Set TS Set
// FQImport: com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml.setup TS setup
// FQImport: com.lightningkite.khrysalis.views.SelectDateMonthCVD.selectedDayPaint TS selectedDayPaint
// FQImport: com.lightningkite.khrysalis.observables.StandardObservableProperty TS StandardObservableProperty
// FQImport: com.lightningkite.khrysalis.views.SelectMultipleDatesMonthCVD.dragEnabled TS dragEnabled
// FQImport: com.lightningkite.khrysalis.views.SelectDateMonthCVD.dragEnabled TS dragEnabled
// FQImport: com.lightningkite.khrysalis.views.SelectDateRangeMonthCVD.dragEnabled TS dragEnabled
// FQImport: com.lightningkite.khrysalis.views.SelectDateRangeMonthCVD.selectedPaint TS selectedPaint
// FQImport: com.lightningkite.khrysalis.views.SelectDateMonthCVD.selectedPaint TS selectedPaint
// FQImport: com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml.month2Delegate TS month2Delegate
import { DateRangeDemoXml } from '../layout/DateRangeDemoXml'
import { StandardObservableProperty } from 'khrysalis/dist/observables/StandardObservableProperty.shared'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { numberToColor } from 'khrysalis/dist/views/Colors.actual'

//! Declares com.lightningkite.khrysalistemplate.vg.DateRangeDemoVG
export class DateRangeDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.start = new StandardObservableProperty(new Date(), undefined);
        this.endInclusive = new StandardObservableProperty(new Date(), undefined);
        this.dates = new StandardObservableProperty(new Set([]), undefined);
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.DateRangeDemoVG.title
    public get title(): string { return "Date Range Demo"; }
    
    
    public readonly start: StandardObservableProperty<(Date | null)>;
    
    public readonly endInclusive: StandardObservableProperty<(Date | null)>;
    
    public readonly dates: StandardObservableProperty<Set<Date>>;
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new DateRangeDemoXml();
        
        const view = xml.setup(dependency);
        
        
        
        xml.month2Delegate.dragEnabled = false;
        xml.month2Delegate.selectedDayPaint.color = numberToColor(0xFFFFFFFF);
        xml.month2Delegate.selectedPaint.color = numberToColor(0xFFFF0000);
        xml.month3Delegate.dragEnabled = false;
        xml.month3Delegate.selectedDayPaint.color = numberToColor(0xFFFFFFFF);
        xml.month3Delegate.selectedPaint.color = numberToColor(0xFFFF0000);
        xml.month4Delegate.dragEnabled = false;
        xml.month4Delegate.selectedDayPaint.color = numberToColor(0xFFFFFFFF);
        xml.month4Delegate.selectedPaint.color = numberToColor(0xFFFF0000);
        
        return view;
    }
    
}

