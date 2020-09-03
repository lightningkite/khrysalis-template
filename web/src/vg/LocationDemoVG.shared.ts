// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/LocationDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { MutableObservableProperty } from 'khrysalis/dist/observables/MutableObservableProperty.shared'
import { StandardObservableProperty } from 'khrysalis/dist/observables/StandardObservableProperty.shared'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { xTextViewBindString } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { LocationDemoXml } from '../layout/LocationDemoXml'
import { xActivityAccessRequestLocation } from 'khrysalis/dist/location/ViewDependency.location.actual'
import { xObservablePropertyTransformed } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'
import { LocationResult } from 'khrysalis/dist/location/LocationResult.shared'

//! Declares com.lightningkite.khrysalistemplate.vg.LocationDemoVG
export class LocationDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.locationInfo = new StandardObservableProperty<(LocationResult | null)>(null, undefined);
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.LocationDemoVG.title
    public get title(): string { return "Location Demo"; }
    
    
    public readonly locationInfo: MutableObservableProperty<(LocationResult | null)>;
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new LocationDemoXml();
        
        const view = xml.setup(dependency);
        
        xml.getLocation.onclick = (_ev) => { _ev.stopPropagation(); 
            xActivityAccessRequestLocation(dependency, 100.0, 5.0, (location: (LocationResult | null), message: (string | null)): void => {
                    console.log(message);
                    this.locationInfo.value = location;
            });
        };
        xTextViewBindString(xml.locationDisplay, xObservablePropertyTransformed<(LocationResult | null), string>(this.locationInfo, (it: (LocationResult | null)): string => {
                    if (it !== null) {
                        return `${it!.coordinate}`;
                    } else {
                        return "Nothing yet";
                    }
        }));
        return view;
    }
}

