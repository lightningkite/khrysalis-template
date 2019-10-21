//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift



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
                xml.image.loadUrl(url.toString())
            }
        }
        xml.gallery.onClick{ () in 
            dependency.requestImageGallery{ (url) in 
                xml.image.loadUrl(url.toString())
            }
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
 
