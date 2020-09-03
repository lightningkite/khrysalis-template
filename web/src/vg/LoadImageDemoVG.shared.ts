// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/LoadImageDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { xDisposableUntil, xViewRemovedGet } from 'khrysalis/dist/rx/DisposeCondition.actual'
import { xImageViewBindImage } from 'khrysalis/dist/observables/binding/ImageView.binding.actual'
import { xActivityAccessRequestImageCamera, xActivityAccessRequestImageGallery, xActivityAccessRequestImagesGallery } from 'khrysalis/dist/views/ViewDependency.actual'
import { Image, ImageReference, ImageRemoteUrl } from 'khrysalis/dist/Image.shared'
import { SubscriptionLike } from 'rxjs'
import { xObservablePropertySubscribeBy } from 'khrysalis/dist/observables/ObservableProperty.ext.shared'
import { xImageToHttpBody } from 'khrysalis/dist/net/HttpBody.actual'
import { printStackTrace, runOrNull } from 'khrysalis/dist/kotlin/Language'
import { StandardObservableProperty } from 'khrysalis/dist/observables/StandardObservableProperty.shared'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { LoadImageDemoXml } from '../layout/LoadImageDemoXml'
import { xTextViewBindString } from 'khrysalis/dist/observables/binding/TextView.binding.actual'
import { xObservablePropertyMap } from 'khrysalis/dist/observables/TransformedObservableProperty.shared'

//! Declares com.lightningkite.khrysalistemplate.vg.LoadImageDemoVG
export class LoadImageDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.canUpload = new StandardObservableProperty<(boolean | null)>(null, undefined);
        this.currentImage = new StandardObservableProperty<(Image | null)>(null, undefined);
    }
    
    //! Declares com.lightningkite.khrysalistemplate.vg.LoadImageDemoVG.title
    public get title(): string { return "Load Image Demo"; }
    
    
    public readonly canUpload: StandardObservableProperty<(boolean | null)>;
    
    public readonly currentImage: StandardObservableProperty<(Image | null)>;
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new LoadImageDemoXml();
        
        const view = xml.setup(dependency);
        
        
        xDisposableUntil<SubscriptionLike>(xObservablePropertySubscribeBy<(Image | null)>(this.currentImage, undefined, undefined, (it: (Image | null)): void => {
                    this.canUpload.value = null;
        }), xViewRemovedGet(view));
        
        xImageViewBindImage(xml.image, this.currentImage);
        xml.camera.onclick = (_ev) => { _ev.stopPropagation(); 
            xActivityAccessRequestImageCamera(dependency, undefined, (url: File): void => {
                    this.currentImage.value = new ImageReference(url);
            });
        };
        xml.galleryMultiple.onclick = (_ev) => { _ev.stopPropagation(); 
            xActivityAccessRequestImagesGallery(dependency, (urls: Array<File>): void => {
                    const url_26 = (urls[0] ?? null);
                    if (url_26 !== null) { 
                        this.currentImage.value = new ImageReference(url_26);
                    }
            });
        };
        xml.gallery.onclick = (_ev) => { _ev.stopPropagation(); 
            xActivityAccessRequestImageGallery(dependency, (url: File): void => {
                    this.currentImage.value = new ImageReference(url);
            });
        };
        xml.loremPixel.onclick = (_ev) => { _ev.stopPropagation(); 
            this.currentImage.value = new ImageRemoteUrl("https://picsum.photos/200");
        };
        xml.checkCanUpload.onclick = (_ev) => { _ev.stopPropagation(); 
            const i_30 = this.currentImage.value;
            if (i_30 !== null) { 
                xImageToHttpBody(i_30, undefined).subscribe((it: BodyInit): void => {
                        this.canUpload.value = true;
                    }, (it: any): void => {
                        printStackTrace(it);
                        this.canUpload.value = false;
                });
            }
        };
        xTextViewBindString(xml.canUpload, xObservablePropertyMap<(boolean | null), string>(this.canUpload, (it: (boolean | null)): string => it === null ? "Not checked" : it === true ? "Good to go!" : "FAILED!!!"));
        return view;
    }
}

