// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/DrawableDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { ViewGenerator } from 'butterfly/dist/views/ViewGenerator'
import { DrawableDemoXml } from '../layout/DrawableDemoXml'

//! Declares com.lightningkite.butterflytemplate.vg.DrawableDemoVG
export class DrawableDemoVG extends ViewGenerator {
    public constructor() {
        super();
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.DrawableDemoVG.title
    public get title(): string { return "Drawable Demo"; }
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new DrawableDemoXml();
        
        const view = xml.setup(dependency);
        
        
        return view;
    }
}
