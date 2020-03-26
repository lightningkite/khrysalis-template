//
// HttpDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class HttpDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.gravity = .topLeft
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.font = UIFont.get(size: 16, style: [])
            view.textString = ResourcesStrings.thisDataIsLoadedFromJsonPlaceholderTypicode
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UITableView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.items = view
            view.separatorStyle = .none
            view.separatorStyle = .none
            view.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.backgroundColor = UIColor.clear
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var items: UITableView!
    
}
