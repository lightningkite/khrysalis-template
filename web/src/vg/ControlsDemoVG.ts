// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/ControlsDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { xAutoCompleteTextViewBind } from 'butterfly/dist/observables/binding/AutoCompleteTextView.binding'
import { xEditTextBindInteger, xEditTextBindString } from 'butterfly/dist/observables/binding/EditText.binding'
import { xTextViewBindString } from 'butterfly/dist/observables/binding/TextView.binding'
import { spinnerBind } from 'butterfly/dist/observables/binding/Spinner.binding'
import { ControlsDemoXml } from '../layout/ControlsDemoXml'
import { ViewGenerator } from 'butterfly/dist/views/ViewGenerator'
import { StandardObservableProperty } from 'butterfly/dist/observables/StandardObservableProperty'

//! Declares com.lightningkite.butterflytemplate.vg.ControlsDemoVG
export class ControlsDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.text = new StandardObservableProperty<string>("", undefined);
        this.options = new StandardObservableProperty<Array<string>>(["Apple", "Banana", "Chili Pepper", "Dragon Fruit"], undefined);
        this._number = new StandardObservableProperty<number>(32, undefined);
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.ControlsDemoVG.title
    public get title(): string { return "Controls Demo"; }
    
    
    public readonly text: StandardObservableProperty<string>;
    
    public readonly options: StandardObservableProperty<Array<string>>;
    
    public readonly _number: StandardObservableProperty<number>;
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new ControlsDemoXml();
        
        const view = xml.setup(dependency);
        
        
        xEditTextBindInteger(xml.numberText, this._number);
        xEditTextBindString(xml.editableText, this.text);
        xEditTextBindString(xml.editableAutoText, this.text);
        xAutoCompleteTextViewBind<string>(xml.editableAutoText, this.options, (it: string): string => it, (item: string): void => {
                this.text.value = item;
        });
        xTextViewBindString(xml.editableTextCopy, this.text);
        xEditTextBindString(xml.editableTextBig, this.text);
        spinnerBind<string>(xml.spinner, this.options, this.text, undefined);
        
        return view;
    }
}
