//
// LoadImageDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class LoadImageDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        view.gravity = .topLeft
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.gallery = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.gallery
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.gallery
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.galleryMultiple = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = "Multiple Gallery"
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = "Multiple Gallery"
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.camera = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.camera
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.camera
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.loremPixel = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.lorem_pixel
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.lorem_pixel
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        view.addSubview(
            UIImageView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 200.0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.image = view
            view.clipsToBounds = true
            view.contentMode = .scaleAspectFit
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.checkCanUpload = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = "Check if it can upload"
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = "Check if it can upload"
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topLeft,
            weight: 0
        ) { view in 
            self.canUpload = view
            view.font = UIFont.get(size: 12, style: [])
            view.textString = "Don't know"
            view.numberOfLines = 0
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var gallery: UIButtonWithLayer!
    public unowned var galleryMultiple: UIButtonWithLayer!
    public unowned var camera: UIButtonWithLayer!
    public unowned var loremPixel: UIButtonWithLayer!
    public unowned var image: UIImageView!
    public unowned var checkCanUpload: UIButtonWithLayer!
    public unowned var canUpload: UILabel!
    
}
