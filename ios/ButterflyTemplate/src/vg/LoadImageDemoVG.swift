// File: /home/jivie/Projects/khrysalis-template/android/src/main/java/com/lightningkite/butterflytemplate/vg/LoadImageDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
// Generated by Khrysalis - this file will be overwritten.
import UIKit
import LKButterfly
import Foundation

public class LoadImageDemoVG : ViewGenerator {
    override public init() {
        self.canUpload = (StandardObservableProperty(underlyingValue: nil as Bool?) as StandardObservableProperty<Bool?>)
        self.currentImage = (StandardObservableProperty(underlyingValue: nil as Image?) as StandardObservableProperty<Image?>)
        super.init()
        //Necessary properties should be initialized now
    }
    
    override public var title: String {
        get { return "Load Image Demo" }
    }
    
    public let canUpload: StandardObservableProperty<Bool?>
    public let currentImage: StandardObservableProperty<Image?>
    
    override public func generate(dependency: ViewControllerAccess) -> UIView {
        let xml = LoadImageDemoXml()
        let view = xml.setup(dependency: dependency)
        
        self.currentImage.subscribeBy(onNext: { (it) -> Void in self.canUpload.value = nil }).until(condition: view.removed)
        
        xml.image.bindImage(image: self.currentImage)
        xml.camera.onClick(action: { () -> Void in dependency.requestImageCamera(callback: { (url) -> Void in self.currentImage.value = ImageReference(uri: url) }) })
        xml.galleryMultiple.onClick(action: { () -> Void in dependency.requestImagesGallery(callback: { (urls) -> Void in if let url = (urls.first) {
            self.currentImage.value = ImageReference(uri: url)
        } }) })
        xml.gallery.onClick(action: { () -> Void in dependency.requestImageGallery(callback: { (url) -> Void in self.currentImage.value = ImageReference(uri: url) }) })
        xml.loremPixel.onClick(action: { () -> Void in self.currentImage.value = ImageRemoteUrl(url: "https://picsum.photos/200") })
        xml.checkCanUpload.onClick(action: { () -> Void in if let i = (self.currentImage.value) {
            i.toHttpBody().subscribe(onSuccess: { (it) -> Void in self.canUpload.value = true }, onError: { (it) -> Void in
                it.printStackTrace()
                self.canUpload.value = false
            })
        } })
        xml.canUpload.bindString(observable: self.canUpload.map(read: { (it) -> String in it == nil ? "Not checked" : it == true ? "Good to go!" : "FAILED!!!" }))
        return view
    }
}

