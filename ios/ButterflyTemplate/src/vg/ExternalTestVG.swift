// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: vg/ExternalTestVG.kt
// Package: com.lightningkite.butterflytemplate.vg
import UIKit
import Butterfly
import Foundation

public class ExternalTestVG : ViewGenerator {
    override public init() {
        super.init()
        //Necessary properties should be initialized now
    }
    
    
    
    override public var title: String {
        get { return "External Test" }
    }
    
    override public func generate(dependency: ViewControllerAccess) -> UIView {
        let xml = ExternalTestXml()
        let view = xml.setup(dependency: dependency)
        
        //--- Set Up xml.scrollView (overwritten on flow generation)
        
        //--- Set Up xml.openMap
        xml.openMap.onClick(action: { () -> Void in dependency.openMap(coordinate: GeoCoordinate(latitude: 41.7269, longitude: (-111.8432)), label: "Lightning Kite", zoom: 14) })
        
        //--- Set Up xml.openWeb
        xml.openWeb.onClick(action: { () -> Void in dependency.openUrl(url: "https://lightningkite.com") })
        
        //--- Set Up xml.openEvent
        xml.openEvent.onClick(action: { () -> Void in dependency.openEvent(title: "A Virtual Lunch with LK", myDescription: "Come eat virtual food with us!", location: "Lightning Kite in Logan Utah", start: Date().addDayOfMonth(value: 1).hourOfDay(value: 12).minuteOfHour(value: 0).secondOfMinute(value: 0), end: Date().addDayOfMonth(value: 1).hourOfDay(value: 13).minuteOfHour(value: 0).secondOfMinute(value: 0)) })
        
        //--- Set Up xml.pickImage
        xml.pickImage.onClick(action: { () -> Void in dependency.requestImageGallery(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickImages
        xml.pickImages.onClick(action: { () -> Void in dependency.requestImagesGallery(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickVideo
        xml.pickVideo.onClick(action: { () -> Void in dependency.requestVideoGallery(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickVideos
        xml.pickVideos.onClick(action: { () -> Void in dependency.requestVideosGallery(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickMedia
        xml.pickMedia.onClick(action: { () -> Void in dependency.requestMediaGallery(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickMedias
        xml.pickMedias.onClick(action: { () -> Void in dependency.requestMediasGallery(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickFile
        xml.pickFile.onClick(action: { () -> Void in dependency.requestFile(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Set Up xml.pickFiles
        xml.pickFiles.onClick(action: { () -> Void in dependency.requestFiles(callback: { (it) -> Void in print("Got \(it)") }) })
        
        //--- Generate End (overwritten on flow generation)
        
        return view
    }
    
    //--- Init
    
    
    
    //--- Actions
    
    //--- Action openMapClick
    //--- Action openWebClick
    //--- Action openEventClick
    
    public func pickImageClick() -> Void {
    }
    public func pickImagesClick() -> Void {
    }
    public func pickVideoClick() -> Void {
    }
    public func pickVideosClick() -> Void {
    }
    public func pickMediaClick() -> Void {
    }
    public func pickMediasClick() -> Void {
    }
    public func pickFileClick() -> Void {
    }
    public func pickFilesClick() -> Void {
    }
    
    //--- Body End
}


