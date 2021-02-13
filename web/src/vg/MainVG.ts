// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/MainVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { xSwapViewBindStack } from 'butterfly-web/dist/observables/binding/SwapView.binding'
import { xViewBindVisible } from 'butterfly-web/dist/observables/binding/View.binding'
import { ExampleContentVG } from './ExampleContentVG'
import { MainXml } from '../layout/MainXml'
import { xTextViewBindString } from 'butterfly-web/dist/observables/binding/TextView.binding'
import { ViewGenerator } from 'butterfly-web/dist/views/ViewGenerator'
import { iterLastOrNull } from 'butterfly-web/dist/KotlinCollections'
import { xObservablePropertyMap } from 'butterfly-web/dist/observables/TransformedObservableProperty'
import { SelectDemoVG } from './SelectDemoVG'
import { EntryPoint } from 'butterfly-web/dist/views/EntryPoint'
import { ObservableStack } from 'butterfly-web/dist/observables/ObservableStack'
import { ObservableProperty } from 'butterfly-web/dist/observables/ObservableProperty'
import { xViewOnClick } from 'butterfly-web/dist/views/View.ext'
import { HasBackAction, HasBackActionDefaults } from 'butterfly-web/dist/views/HasBackAction'

//! Declares com.lightningkite.butterflytemplate.vg.MainVG
export class MainVG extends ViewGenerator implements EntryPoint {
    public static implementsInterfaceComLightningkiteButterflyViewsEntryPoint = true;
    public static implementsInterfaceComLightningkiteButterflyViewsHasBackAction = true;
    public constructor() {
        super();
        this.stack = new ObservableStack<ViewGenerator>();
        this.shouldBackBeShown = xObservablePropertyMap<Array<ViewGenerator>, boolean>(this.stack, (it: Array<ViewGenerator>): boolean => it.length > 1);
        this.stack.push(new SelectDemoVG(this.stack));
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.MainVG.title
    public get title(): string { return "Main"; }
    
    
    public readonly stack: ObservableStack<ViewGenerator>;
    
    //! Declares com.lightningkite.butterflytemplate.vg.MainVG.mainStack
    public get mainStack(): (ObservableStack<ViewGenerator> | null) { return this.stack; }
    
    public readonly shouldBackBeShown: ObservableProperty<boolean>;
    
    
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new MainXml();
        
        const view = xml.setup(dependency);
        
        
        xSwapViewBindStack<ViewGenerator>(xml.mainContent, dependency, this.stack);
        xTextViewBindString(xml.title, xObservablePropertyMap<Array<ViewGenerator>, string>(this.stack, (it: Array<ViewGenerator>): string => (iterLastOrNull(it)?.title ?? null) ?? ""));
        xViewBindVisible(xml.mainBack, this.shouldBackBeShown);
        xViewOnClick(xml.mainBack, undefined, (): void => {
                this.stack.pop();
        });
        
        return view;
    }
    
    public handleDeepLink(schema: string, host: string, path: string, params: Map<string, string>): void {
        this.stack.push(new ExampleContentVG());
    }
    
    public onBackPressed(): boolean { return HasBackActionDefaults.onBackPressed(this); }
}

