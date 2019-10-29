//
// SelectDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

class SelectDemoXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 16 + 0, left: 16 + 0, bottom: 16 + 0, right: 16 + 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.text = ResourcesStrings.selectDemo
            view.numberOfLines = 0
            view.font = UIFont.get(size: 24, style: ["bold"])
            view.textColor = UIColor(argb: 0xFF000000)
            view.textAlignment = .center
            view.baselineAdjustment = .alignCenters
        }
        
        view.addSubview(
            UITableView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.list = view
        }
        
        xmlRoot = view
        return view
    }
    
    unowned var list: UITableView!
    
}
