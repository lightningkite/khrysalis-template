//
// RowTextXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class RowTextXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8 + 8, left: 8 + 8, bottom: 8 + 8, right: 8 + 8),
            gravity: .topFill
        ) { view in 
            self.label = view
            view.numberOfLines = 0
            view.font = UIFont.get(size: 16, style: [])
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var label: UILabel!
    
}
