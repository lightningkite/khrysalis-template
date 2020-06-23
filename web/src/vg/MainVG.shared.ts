// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/MainVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
// FQImport: com.lightningkite.khrysalis.views.EntryPoint TS EntryPoint
// FQImport: com.lightningkite.khrysalistemplate.layouts.MainXml TS MainXml
// FQImport: com.lightningkite.khrysalistemplate.vg.ExampleContentVG TS ExampleContentVG
// FQImport: com.lightningkite.khrysalis.observables.binding.bindVisible>android.view.View TS androidViewViewBindVisible
// FQImport: com.lightningkite.khrysalistemplate.layouts.MainXml.mainBack TS mainBack
// FQImport: kotlin.collections.Map TS Map
// FQImport: com.lightningkite.khrysalis.observables.binding.bindStack>com.lightningkite.khrysalis.views.android.SwapView TS comLightningkiteKhrysalisViewsAndroidSwapViewBindStack
// FQImport: com.lightningkite.khrysalis.views.ViewGenerator.title TS title
// FQImport: com.lightningkite.khrysalis.views.ViewGenerator TS ViewGenerator
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.shouldBackBeShown.<anonymous>.it TS it
// FQImport: com.lightningkite.khrysalistemplate.vg.SelectDemoVG TS SelectDemoVG
// FQImport: com.lightningkite.khrysalistemplate.layouts.MainXml.title TS title
// FQImport: com.lightningkite.khrysalis.observables.map>com.lightningkite.khrysalis.observables.ObservableProperty<kotlin.Any> TS comLightningkiteKhrysalisObservablesObservablePropertyMap
// FQImport: com.lightningkite.khrysalis.observables.ObservableStack.push TS push
// FQImport: com.lightningkite.khrysalis.observables.ObservableStack.pop TS pop
// FQImport: com.lightningkite.khrysalis.views.EntryPoint TS EntryPointDefaults
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.shouldBackBeShown TS shouldBackBeShown
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.generate.xml TS xml
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.generate.<anonymous>.it TS it
// FQImport: com.lightningkite.khrysalis.observables.ObservableStack TS ObservableStack
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.stack TS stack
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.generate.dependency TS dependency
// FQImport: com.lightningkite.khrysalistemplate.layouts.MainXml.setup TS setup
// FQImport: com.lightningkite.khrysalis.observables.ObservableProperty TS ObservableProperty
// FQImport: com.lightningkite.khrysalistemplate.layouts.MainXml.mainContent TS mainContent
// FQImport: com.lightningkite.khrysalis.observables.binding.bindString>android.widget.TextView TS androidWidgetTextViewBindString
// FQImport: com.lightningkite.khrysalistemplate.vg.MainVG.generate.view TS view
import { androidViewViewBindVisible } from 'khrysalis/dist/observables/binding/View.binding.actual'
import { comLightningkiteKhrysalisViewsAndroidSwapViewBindStack } from 'khrysalis/dist/observables/binding/SwapView.binding.actual'
import { EntryPoint, EntryPointDefaults } from 'khrysalis/dist/views/EntryPoint.shared'
import { SelectDemoVG } from './SelectDemoVG.shared'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { comLightningkiteKhrysalisObservablesObservablePropertyMap } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'
import { MainXml } from '../layout/MainXml'
import { androidWidgetTextViewBindString } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { ExampleContentVG } from './ExampleContentVG.shared'
import { ObservableStack } from 'khrysalis/dist/observables/ObservableStack.shared'
import { ObservableProperty } from 'khrysalis/dist/observables/ObservableProperty.shared'

//! Declares com.lightningkite.khrysalistemplate.vg.MainVG
export class MainVG extends ViewGenerator implements EntryPoint {
    public static implementsInterfaceComLightningkiteKhrysalisViewsEntryPoint = true;
    public constructor() {
        super();
        this.stack = new ObservableStack<ViewGenerator>();
        this.shouldBackBeShown = comLightningkiteKhrysalisObservablesObservablePropertyMap(this.stack, (it) => it.length > 1);
        this.stack.push(new SelectDemoVG(this.stack));
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.MainVG.title
    public get title(): string { return "Main"; }
    
    
    public readonly stack: ObservableStack<ViewGenerator>;
    
    //! Declares com.lightningkite.khrysalistemplate.vg.MainVG.mainStack
    public get mainStack(): (ObservableStack<ViewGenerator> | null) { return this.stack; }
    
    public readonly shouldBackBeShown: ObservableProperty<boolean>;
    
    
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new MainXml();
        
        const view = xml.setup(dependency);
        
        
        comLightningkiteKhrysalisViewsAndroidSwapViewBindStack(xml.mainContent, dependency, this.stack);
        androidWidgetTextViewBindString(xml.title, comLightningkiteKhrysalisObservablesObservablePropertyMap(this.stack, (it) => (it[it.length - 1] ?? null)?.title ?? ""));
        androidViewViewBindVisible(xml.mainBack, this.shouldBackBeShown);
        xml.mainBack.onclick = (_ev) => { _ev.stopPropagation(); 
            this.stack.pop();
        };
        
        return view;
    }
    
    public handleDeepLink(schema: string, host: string, path: string, params: Map<string, string>): void {
        this.stack.push(new ExampleContentVG());
    }
    
    public onBackPressed(): boolean { return EntryPointDefaults.onBackPressed(this); }
}

