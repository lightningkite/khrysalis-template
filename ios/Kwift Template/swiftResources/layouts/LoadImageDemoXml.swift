//
// LoadImageDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

class LoadImageDemoXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.gravity = .topLeft
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.gallery = view
            view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
            view.setTitle(ResourcesStrings.gallery, for: .normal)
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            view.titleLabel?.text = ResourcesStrings.gallery
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.font = UIFont.get(size: 16, style: [])
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.camera = view
            view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
            view.setTitle(ResourcesStrings.camera, for: .normal)
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            view.titleLabel?.text = ResourcesStrings.camera
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.font = UIFont.get(size: 16, style: [])
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
        }
        
        view.addSubview(
            UIImageView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 200),
            margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.image = view
            view.clipsToBounds = true
            view.contentMode = .scaleAspectFit
        }
        
        xmlRoot = view
        return view
    }
    
    unowned var image: UIImageView!
    unowned var camera: UIButtonWithLayer!
    unowned var gallery: UIButtonWithLayer!
    
}
