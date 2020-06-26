// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/MarginTestVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { MarginTestXml } from '../layout/MarginTestXml'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'

//! Declares com.lightningkite.khrysalistemplate.vg.MarginTestsVG
export class MarginTestsVG extends ViewGenerator {
    public constructor() {
        super();
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.MarginTestsVG.title
    public get title(): string { return "Margin Tests"; }
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new MarginTestXml();
        
        const view = xml.setup(dependency);
        
        xml.scrollToTop.onclick = (_ev) => { _ev.stopPropagation(); 
            xml.scrollView.scroll(0, 0);
        };
        return view;
    }
}

