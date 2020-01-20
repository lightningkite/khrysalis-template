//
// ComponentTestXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class ComponentTestXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .x
        view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.gravity = .centerCenter
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .centerCenter,
            weight: 1.0
        ) { view in 
            self.label = view
            view.font = UIFont.get(size: 16, style: [])
            view.textString = ResourcesStrings.welcomeToSwitchTown
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            padding: UIEdgeInsets.zero,
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            self.button = view
            view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
            view.titleLabel?.font = UIFont.get(size: 16, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = ResourcesStrings.ok
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = ResourcesStrings.ok
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var button: UIButtonWithLayer!
    public unowned var label: UILabel!
    
}
