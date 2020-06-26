// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/DrawableDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { DrawableDemoXml } from '../layout/DrawableDemoXml'

//! Declares com.lightningkite.khrysalistemplate.vg.DrawableDemoVG
export class DrawableDemoVG extends ViewGenerator {
    public constructor() {
        super();
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.DrawableDemoVG.title
    public get title(): string { return "Drawable Demo"; }
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new DrawableDemoXml();
        
        const view = xml.setup(dependency);
        
        
        return view;
    }
}
