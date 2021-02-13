// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/VideoDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import { xImageViewBindVideoThumbnail } from 'butterfly-web/dist/observables/binding/ImageView.binding'
import { Video, VideoReference, VideoRemoteUrl } from 'butterfly-web/dist/Video'
import { VideoDemoXml } from '../layout/VideoDemoXml'
import { ViewGenerator } from 'butterfly-web/dist/views/ViewGenerator'
import { xActivityAccessRequestVideoCamera, xActivityAccessRequestVideoGallery, xActivityAccessRequestVideosGallery } from 'butterfly-web/dist/views/ViewDependency'
import { xVideoPlayerBind } from 'butterfly-web/dist/observables/binding/VideoPlayer.binding'
import { StandardObservableProperty } from 'butterfly-web/dist/observables/StandardObservableProperty'
import { runOrNull } from 'butterfly-web/dist/kotlin/Language'
import { xViewOnClick } from 'butterfly-web/dist/views/View.ext'

//! Declares com.lightningkite.butterflytemplate.vg.VideoDemoVG
export class VideoDemoVG extends ViewGenerator {
    public constructor() {
        super();
        this.currentVideo = new StandardObservableProperty<(Video | null)>(new VideoRemoteUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"), undefined);
        this.timesPlayPressed = new StandardObservableProperty<number>(0, undefined);
    }
    
    
    
    //! Declares com.lightningkite.butterflytemplate.vg.VideoDemoVG.title
    public get title(): string { return "Video Demo"; }
    
    
    public readonly currentVideo: StandardObservableProperty<(Video | null)>;
    
    public readonly timesPlayPressed: StandardObservableProperty<number>;
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new VideoDemoXml();
        
        const view = xml.setup(dependency);
        
        
        //--- Set Up xml.video
        xVideoPlayerBind(xml.video, this.currentVideo);
        
        //--- Set Up xml.thumbnail
        xImageViewBindVideoThumbnail(xml.thumbnail, this.currentVideo);
        
        //--- Set Up xml.play (overwritten on flow generation)
        xViewOnClick(xml.play, undefined, (): void => {
                this.playClick();
        });
        
        //--- Set Up xml.gallery
        xViewOnClick(xml.gallery, undefined, (): void => {
                xActivityAccessRequestVideoGallery(dependency, (it: File): void => {
                        this.currentVideo.value = new VideoReference(it);
                });
        });
        
        //--- Set Up xml.camera
        xViewOnClick(xml.camera, undefined, (): void => {
                xActivityAccessRequestVideoCamera(dependency, undefined, (it: File): void => {
                        this.currentVideo.value = new VideoReference(it);
                });
        });
        
        //--- Set Up xml.galleryMulti
        xViewOnClick(xml.galleryMulti, undefined, (): void => {
                xActivityAccessRequestVideosGallery(dependency, (it: Array<File>): void => {
                        const it_206 = (it[0] ?? null);
                        if (it_206 !== null) { 
                            this.currentVideo.value = new VideoReference(it_206);
                        }
                });
        });
        
        //--- Generate End (overwritten on flow generation)
        
        return view;
    }
    
    //--- Init
    
    
    
    //--- Actions
    
    public playClick(): void {
        this.timesPlayPressed.value = this.timesPlayPressed.value + 1;
        switch(this.timesPlayPressed.value % 3) {
            case 0:
            this.currentVideo.value = new VideoRemoteUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
            break;
            case 1:
            this.currentVideo.value = new VideoRemoteUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
            break;
            case 2:
            this.currentVideo.value = null
            break;
        }
        
    }
    
    //--- Action galleryClick
    
    public cameraClick(): void {
    }
    public galleryMultiClick(): void {
    }
    
    //--- Body End
}

