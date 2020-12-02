//
// ComponentTestXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class ComponentTestXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .x
        view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        view.gravity = .centerCenter
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0.0, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .centerCenter,
            weight: 1.0
        ) { view in 
            self.label = view
            view.font = UIFont.get(size: 16.0, style: [])
            view.textString = R.string.welcome_to_switch_town
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            self.button = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.ok
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.ok
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        xmlRoot = view
        return view
    }
    
    public var _label: UILabel!
    public var label: UILabel { get { return _label } set(value){ _label = value } }
    public var _button: UIButtonWithLayer!
    public var button: UIButtonWithLayer { get { return _button } set(value){ _button = value } }
    
}
