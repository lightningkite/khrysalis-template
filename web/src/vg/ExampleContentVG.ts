// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/ExampleContentVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { ObservableProperty } from 'butterfly/dist/observables/ObservableProperty'
import { ExampleContentXml } from '../layout/ExampleContentXml'
import { xTextViewBindString, xTextViewBindText } from 'butterfly/dist/observables/binding/TextView.binding'
import { xObservablePropertyMap } from 'butterfly/dist/observables/TransformedObservableProperty'
import { MutableObservableProperty } from 'butterfly/dist/observables/MutableObservableProperty'
import { ViewGenerator } from 'butterfly/dist/views/ViewGenerator'
import { StandardObservableProperty } from 'butterfly/dist/observables/StandardObservableProperty'
import { xObservablePropertyFlatMap } from 'butterfly/dist/observables/FlatMappedObservableProperty'

//! Declares com.lightningkite.butterflytemplate.vg.ExampleContentVG
export class ExampleContentVG extends ViewGenerator {
    public constructor() {
        super();
        this._number = new StandardObservableProperty<number>(0, undefined);
        this.chained = new StandardObservableProperty<MutableObservableProperty<number>>(new StandardObservableProperty<number>(0, undefined), undefined);
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.ExampleContentVG.title
    public get title(): string { return "Example Content"; }
    
    
    public readonly _number: StandardObservableProperty<number>;
    
    public readonly chained: StandardObservableProperty<MutableObservableProperty<number>>;
    
    
    public increment(): void {
        const temp4 = this._number;
        temp4.value = temp4.value + 1;
    }
    
    public generate(dependency: Window): HTMLElement {
        const xml = new ExampleContentXml();
        
        const view = xml.setup(dependency);
        
        xml.exampleContentIncrement.onclick = (_ev) => { _ev.stopPropagation(); 
            this.increment();
        };
        xTextViewBindText<number>(xml.exampleContentNumber, this._number, (it: number): string => it.toString());
        xml.chainedIncrement.onclick = (_ev) => { _ev.stopPropagation(); 
            this.chained.value.value = this.chained.value.value + 1;
        };
        xTextViewBindString(xml.chainedNumber, xObservablePropertyMap<number, string>(xObservablePropertyFlatMap<MutableObservableProperty<number>, number>(this.chained, (it: MutableObservableProperty<number>): ObservableProperty<number> => it), (it: number): string => it.toString()));
        xml.scrollToTop.onclick = (_ev) => { _ev.stopPropagation(); 
            xml.scrollView.scroll(0, 0);
        };
        return view;
    }
}

