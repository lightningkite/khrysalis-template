//
// RowTestXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

class RowTestXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .x
        view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.gravity = .centerCenter
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
            gravity: .centerCenter,
            weight: 1.0
        ) { view in 
            self.label = view
            view.text = ResourcesStrings.welcomeToSwitchTown
            view.numberOfLines = 0
            view.font = UIFont.get(size: 16, style: [])
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            self.button = view
            view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
            view.setTitle(ResourcesStrings.ok, for: .normal)
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            view.titleLabel?.text = ResourcesStrings.ok
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.font = UIFont.get(size: 16, style: [])
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
        }
        
        xmlRoot = view
        return view
    }
    
    unowned var button: UIButtonWithLayer!
    unowned var label: UILabel!
    
}
