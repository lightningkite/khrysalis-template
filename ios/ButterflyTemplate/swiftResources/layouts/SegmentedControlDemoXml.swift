//
// SegmentedControlDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class SegmentedControlDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            UISegmentedControlSquare(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.tabs = view
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black], 
                for: .selected
            )
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black], 
                for: .normal
            )
            view.materialTabStyle(color: UIColor.black)
        }
        
        view.addSubview(
            UISegmentedControlSquare(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.tabs2 = view
            view.apportionsSegmentWidthsByContent = true
            view.apportionsSegmentWidthsByContent = true
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black], 
                for: .selected
            )
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black], 
                for: .normal
            )
            view.materialTabStyle(color: UIColor.black)
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var tabs: UISegmentedControlSquare!
    public unowned var tabs2: UISegmentedControlSquare!
    
}
