//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class LoadImageDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Load Image Demo"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = LoadImageDemoXml()
        var view = xml.setup(dependency)
        xml.camera.onClick{ () in 
            dependency.requestImageCamera{ (url) in 
                xml.image.loadImage(ImageReference(url))
            }
        }
        xml.galleryMultiple.onClick{ () in 
            dependency.requestImagesGallery{ (urls) in 
                
                if let url = (urls.firstOrNull()) {
                    xml.image.loadImage(ImageReference(url)) 
                }
            }
        }
        xml.gallery.onClick{ () in 
            dependency.requestImageGallery{ (url) in 
                xml.image.loadImage(ImageReference(url))
            }
        }
        xml.loremPixel.onClick{ () in 
            xml.image.loadImage(ImageRemoteUrl("https://picsum.photos/200"))
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 