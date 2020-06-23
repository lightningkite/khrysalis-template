// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/ExampleContentVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.generate.view TS view
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.exampleContentIncrement TS exampleContentIncrement
// FQImport: com.lightningkite.khrysalis.observables.MutableObservableProperty.value TS value
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.scrollToTop TS scrollToTop
// FQImport: com.lightningkite.khrysalis.observables.binding.bindText>android.widget.TextView TS androidWidgetTextViewBindText
// FQImport: com.lightningkite.khrysalis.views.ViewGenerator TS ViewGenerator
// FQImport: kotlin.Int.toString TS toString
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.generate.xml TS xml
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.chainedIncrement TS chainedIncrement
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml TS ExampleContentXml
// FQImport: com.lightningkite.khrysalis.observables.map>com.lightningkite.khrysalis.observables.ObservableProperty<kotlin.Any> TS comLightningkiteKhrysalisObservablesObservablePropertyMap
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.generate.dependency TS dependency
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.increment TS increment
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.scrollView TS scrollView
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.exampleContentNumber TS exampleContentNumber
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.number TS number
// FQImport: com.lightningkite.khrysalis.observables.flatMap>com.lightningkite.khrysalis.observables.ObservableProperty<kotlin.Any> TS comLightningkiteKhrysalisObservablesObservablePropertyFlatMap
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.chained TS chained
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG.generate.<anonymous>.it TS it
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.chainedNumber TS chainedNumber
// FQImport: com.lightningkite.khrysalis.observables.StandardObservableProperty TS StandardObservableProperty
// FQImport: com.lightningkite.khrysalistemplate.layouts.ExampleContentXml.setup TS setup
// FQImport: com.lightningkite.khrysalis.observables.StandardObservableProperty.value TS value
// FQImport: com.lightningkite.khrysalis.observables.binding.bindString>android.widget.TextView TS androidWidgetTextViewBindString
// FQImport: com.lightningkite.khrysalis.observables.MutableObservableProperty TS MutableObservableProperty
import { ExampleContentXml } from '../layout/ExampleContentXml'
import { androidWidgetTextViewBindString, androidWidgetTextViewBindText } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { MutableObservableProperty } from 'khrysalis/dist/observables/MutableObservableProperty.shared'
import { StandardObservableProperty } from 'khrysalis/dist/observables/StandardObservableProperty.shared'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { comLightningkiteKhrysalisObservablesObservablePropertyMap } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'
import { comLightningkiteKhrysalisObservablesObservablePropertyFlatMap } from 'khrysalis/dist/observables/FlatMappedObservableProperty.shared'

//! Declares com.lightningkite.khrysalistemplate.vg.ExampleContentVG
export class ExampleContentVG extends ViewGenerator {
    public constructor() {
        super();
        this._number = new StandardObservableProperty(0, undefined);
        this.chained = new StandardObservableProperty(new StandardObservableProperty(0, undefined), undefined);
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.ExampleContentVG.title
    public get title(): string { return "Example Content"; }
    
    
    public readonly _number: StandardObservableProperty<number>;
    
    public readonly chained: StandardObservableProperty<MutableObservableProperty<number>>;
    
    
    public increment(): void {
        this._number.value += 1;
    }
    
    public generate(dependency: Window): HTMLElement {
        const xml = new ExampleContentXml();
        
        const view = xml.setup(dependency);
        
        xml.exampleContentIncrement.onclick = (_ev) => { _ev.stopPropagation(); 
            this.increment();
        };
        androidWidgetTextViewBindText(xml.exampleContentNumber, this._number, (it) => it.toString());
        xml.chainedIncrement.onclick = (_ev) => { _ev.stopPropagation(); 
            this.chained.value.value = this.chained.value.value + 1;
        };
        androidWidgetTextViewBindString(xml.chainedNumber, comLightningkiteKhrysalisObservablesObservablePropertyMap(comLightningkiteKhrysalisObservablesObservablePropertyFlatMap(this.chained, (it) => it), (it) => it.toString()));
        xml.scrollToTop.onclick = (_ev) => { _ev.stopPropagation(); 
            xml.scrollView.scroll(0, 0);
        };
        return view;
    }
}

