//
// LocationDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class LocationDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
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
            self.getLocation = view
            view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
            view.setTitle(ResourcesStrings.getLocation, for: .normal)
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            view.titleLabel?.text = ResourcesStrings.getLocation
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.font = UIFont.get(size: 16, style: [])
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
        }
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.locationDisplay = view
            view.text = ResourcesStrings.camera
            view.numberOfLines = 0
            view.font = UIFont.get(size: 16, style: [])
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var getLocation: UIButtonWithLayer!
    public unowned var locationDisplay: UILabel!
    
}
