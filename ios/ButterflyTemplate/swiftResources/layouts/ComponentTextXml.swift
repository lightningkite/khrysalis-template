//
// ComponentTextXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class ComponentTextXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            gravity: .topFill
        ) { view in 
            self.label = view
            view.font = UIFont.get(size: 16.0, style: [])
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        xmlRoot = view
        return view
    }
    
    public var _label: UILabel!
    public var label: UILabel { get { return _label } set(value){ _label = value } }
    
}
