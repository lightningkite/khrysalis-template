//
// WeekDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class WeekDemoXml {
    
    weak var week: UIWeekView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIView in 
            let view = UIView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).padding(0, 0, 0, 0).alignContent(.start).justifyContent(.start).define{ (flex) in 
                flex.addItem({ () -> UIWeekView in 
                    let view = UIWeekView(frame: .zero)
                    self.week = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    return view
                }()
                ).margin(0, 0, 0, 0).grow(1).shrink(1).height(0).alignSelf(.stretch)
                
            }
            return view
        }()
        
    }
    
}