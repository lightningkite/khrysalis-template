//
// LocationDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class LocationDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        view.gravity = .topLeft
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.getLocation = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.get_location
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.get_location
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.locationDisplay = view
            view.font = UIFont.get(size: 16.0, style: [])
            view.textString = R.string.camera
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        xmlRoot = view
        return view
    }
    
    public var _getLocation: UIButtonWithLayer!
    public var getLocation: UIButtonWithLayer { get { return _getLocation } set(value){ _getLocation = value } }
    public var _locationDisplay: UILabel!
    public var locationDisplay: UILabel { get { return _locationDisplay } set(value){ _locationDisplay = value } }
    
}
