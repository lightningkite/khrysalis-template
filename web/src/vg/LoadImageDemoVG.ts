// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/LoadImageDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { Image, ImageReference, ImageRemoteUrl } from 'butterfly/dist/Image'
import { xActivityAccessRequestImageCamera, xActivityAccessRequestImageGallery, xActivityAccessRequestImagesGallery } from 'butterfly/dist/views/ViewDependency'
import { xObservablePropertySubscribeBy } from 'butterfly/dist/observables/ObservableProperty.ext'
import { xTextViewBindString } from 'butterfly/dist/observables/binding/TextView.binding'
import { HttpBody, xImageToHttpBody } from 'butterfly/dist/net/HttpBody'
import { xObservablePropertyMap } from 'butterfly/dist/observables/TransformedObservableProperty'
import { ViewGenerator } from 'butterfly/dist/views/ViewGenerator'
import { SubscriptionLike } from 'rxjs'
import { xDisposableUntil, xViewRemovedGet } from 'butterfly/dist/rx/DisposeCondition.ext'
import { StandardObservableProperty } from 'butterfly/dist/observables/StandardObservableProperty'
import { xImageViewBindImage } from 'butterfly/dist/observables/binding/ImageView.binding'
import { printStackTrace, runOrNull } from 'butterfly/dist/kotlin/Language'
import { xViewOnClick } from 'butterfly/dist/views/View.ext'
import { LoadImageDemoXml } from '../layout/LoadImageDemoXml'

//! Declares com.lightningkite.butterflytemplate.vg.LoadImageDemoVG
export class LoadImageDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.canUpload = new StandardObservableProperty<(boolean | null)>(null, undefined);
        this.currentImage = new StandardObservableProperty<(Image | null)>(null, undefined);
    }
    
    //! Declares com.lightningkite.butterflytemplate.vg.LoadImageDemoVG.title
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
        xViewOnClick(xml.camera, undefined, (): void => {
                xActivityAccessRequestImageCamera(dependency, undefined, (url: File): void => {
                        this.currentImage.value = new ImageReference(url);
                });
        });
        xViewOnClick(xml.galleryMultiple, undefined, (): void => {
                xActivityAccessRequestImagesGallery(dependency, (urls: Array<File>): void => {
                        const url_40 = (urls[0] ?? null);
                        if (url_40 !== null) { 
                            this.currentImage.value = new ImageReference(url_40);
                        }
                });
        });
        xViewOnClick(xml.gallery, undefined, (): void => {
                xActivityAccessRequestImageGallery(dependency, (url: File): void => {
                        this.currentImage.value = new ImageReference(url);
                });
        });
        xViewOnClick(xml.loremPixel, undefined, (): void => {
                this.currentImage.value = new ImageRemoteUrl("https://picsum.photos/200");
        });
        xViewOnClick(xml.checkCanUpload, undefined, (): void => {
                const i_41 = this.currentImage.value;
                if (i_41 !== null) { 
                    xImageToHttpBody(i_41, undefined, undefined).subscribe((it: HttpBody): void => {
                            this.canUpload.value = true;
                        }, (it: any): void => {
                            printStackTrace(it);
                            this.canUpload.value = false;
                    });
                }
        });
        xTextViewBindString(xml.canUpload, xObservablePropertyMap<(boolean | null), string>(this.canUpload, (it: (boolean | null)): string => it === null ? "Not checked" : it === true ? "Good to go!" : "FAILED!!!"));
        return view;
    }
}

