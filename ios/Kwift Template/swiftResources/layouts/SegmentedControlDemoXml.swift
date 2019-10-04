//
// SegmentedControlDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class SegmentedControlDemoXml {
    
    weak var tabs2: UISegmentedControl!
    weak var tabs: UISegmentedControl!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIView in 
            let view = UIView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).padding(0, 0, 0, 0).alignContent(.start).justifyContent(.start).define{ (flex) in 
                flex.addItem({ () -> UISegmentedControl in 
                    let view = UISegmentedControl(frame: .zero)
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
                    return view
                }()
                ).margin(0, 0, 0, 0).alignSelf(.stretch)
                
                flex.addItem({ () -> UISegmentedControl in 
                    let view = UISegmentedControl(frame: .zero)
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
                    return view
                }()
                ).margin(0, 0, 0, 0).alignSelf(.stretch)
                
            }
            return view
        }()
        
    }
    
}