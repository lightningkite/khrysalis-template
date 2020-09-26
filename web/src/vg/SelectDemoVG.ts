// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/SelectDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { LoadImageDemoVG } from './LoadImageDemoVG'
import { ConstantObservableProperty } from 'butterfly/dist/observables/ConstantObservableProperty'
import { ExampleContentVG } from './ExampleContentVG'
import { VideoDemoVG } from './VideoDemoVG'
import { EntryPoint, EntryPointDefaults } from 'butterfly/dist/views/EntryPoint'
import { HasBackAction, HasBackActionDefaults } from 'butterfly/dist/views/HasBackAction'
import { ViewGenerator } from 'butterfly/dist/views/ViewGenerator'
import { SliderDemoVG } from './SliderDemoVG'
import { ExternalTestVG } from './ExternalTestVG'
import { xRecyclerViewBind } from 'butterfly/dist/observables/binding/RecyclerView.binding'
import { MapDemoVG } from './MapDemoVG'
import { PongDemoVG } from './PongDemoVG'
import { MultipleDemoVG } from './MultipleDemoVG'
import { DateRangeDemoVG } from './DateRangeDemoVG'
import { SelectDemoXml } from '../layout/SelectDemoXml'
import { ObservableProperty } from 'butterfly/dist/observables/ObservableProperty'
import { LocationDemoVG } from './LocationDemoVG'
import { MarginTestsVG } from './MarginTestVG'
import { ComponentTestXml } from '../layout/ComponentTestXml'
import { DateButtonDemoVG } from './DateButtonDemoVG'
import { SegmentedControlDemoVG } from './SegmentedControlDemoVG'
import { LoginDemoVG } from './LoginDemoVG'
import { PreviewVG } from './PreviewVG'
import { ControlsDemoVG } from './ControlsDemoVG'
import { WebsocketDemoVG } from './WebsocketDemoVG'
import { HttpDemoVG } from './HttpDemoVG'
import { DrawableDemoVG } from './DrawableDemoVG'
import { xTextViewBindText } from 'butterfly/dist/observables/binding/TextView.binding'
import { ObservableStack } from 'butterfly/dist/observables/ObservableStack'
import { ViewPagerDemoVG } from './ViewPagerDemoVG'

//! Declares com.lightningkite.butterflytemplate.vg.SelectDemoVG
export class SelectDemoVG extends ViewGenerator implements EntryPoint {
    public static implementsInterfaceComLightningkiteButterflyViewsEntryPoint = true;
    public static implementsInterfaceComLightningkiteButterflyViewsHasBackAction = true;
    public readonly stack: ObservableStack<ViewGenerator>;
    public constructor(stack: ObservableStack<ViewGenerator>) {
        super();
        this.stack = stack;
        this.options = [new VideoDemoVG(), new WebsocketDemoVG(), new HttpDemoVG(), new ExternalTestVG(), new PongDemoVG(), new MarginTestsVG(), new MultipleDemoVG(), new DateButtonDemoVG(), new MapDemoVG(), new LocationDemoVG(), new LoadImageDemoVG(), new ControlsDemoVG(), new ExampleContentVG(), new ViewPagerDemoVG(this.stack), new SegmentedControlDemoVG(), new SliderDemoVG(), new DateRangeDemoVG(), new LoginDemoVG(this.stack), new DrawableDemoVG(), new PreviewVG()];
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.SelectDemoVG.title
    public get title(): string { return "Select Demo"; }
    
    
    public readonly options: Array<ViewGenerator>;
    
    
    public selectVG(viewGenerator: ViewGenerator): void {
        this.stack.push(viewGenerator);
    }
    
    public generate(dependency: Window): HTMLElement {
        const xml = new SelectDemoXml();
        
        const view = xml.setup(dependency);
        
        
        xRecyclerViewBind<ViewGenerator>(xml.list, new ConstantObservableProperty<Array<ViewGenerator>>(this.options), this.options[0], (obs: ObservableProperty<ViewGenerator>): HTMLElement => {
                const xml = new ComponentTestXml();
                
                const view = xml.setup(dependency);
                
                xTextViewBindText<ViewGenerator>(xml.label, obs, (it: ViewGenerator): string => it.title);
                xml.button.onclick = (_ev) => { _ev.stopPropagation(); 
                    this.selectVG(obs.value);
                };
                return view;
        });
        
        return view;
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.SelectDemoVG.mainStack
    public get mainStack(): (ObservableStack<ViewGenerator> | null) { return this.stack; }
    
    public handleDeepLink(schema: string, host: string, path: string, params: Map<string, string>): void { return EntryPointDefaults.handleDeepLink(this, schema, host, path, params); }
    public onBackPressed(): boolean { return HasBackActionDefaults.onBackPressed(this); }
}

