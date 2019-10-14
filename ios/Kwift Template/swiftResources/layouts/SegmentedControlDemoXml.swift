//
// SegmentedControlDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class SegmentedControlDemoXml {
    
    unowned var tabs2: UISegmentedControl!
    unowned var tabs: UISegmentedControl!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        view.addSubview(
            UISegmentedControl(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.tabs = view
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.tintColor = .clear
            view.backgroundColor = .clear
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black], 
                for: .normal
            )
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: ResourcesColors.colorPrimary], 
                for: .selected
            )
            view.addIndicator(color: ResourcesColors.colorPrimary)
        }
        
        view.addSubview(
            UISegmentedControl(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.tabs2 = view
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.tintColor = .clear
            view.backgroundColor = .clear
            view.apportionsSegmentWidthsByContent = true
            view.apportionsSegmentWidthsByContent = true
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.black], 
                for: .normal
            )
            view.setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: ResourcesColors.colorPrimary], 
                for: .selected
            )
            view.addIndicator(color: ResourcesColors.colorPrimary)
        }
        
        
        xmlRoot = view
        return view
    }
    
}