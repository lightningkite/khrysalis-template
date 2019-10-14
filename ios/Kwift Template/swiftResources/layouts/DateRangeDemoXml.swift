//
// DateRangeDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class DateRangeDemoXml {
    
    unowned var select: SelectDayView!
    unowned var range: SelectDateRangeView!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let result = { () -> UIView in 
            let view = UIView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).padding(0, 0, 0, 0).alignContent(.start).justifyContent(.start).define{ (flex) in 
                flex.addItem({ () -> SelectDayView in 
                    let view = SelectDayView(frame: .zero)
                    self.select = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    return view
                }()
                ).margin(0, 0, 0, 0).grow(1.0).shrink(1.0).alignSelf(.stretch)
                
                flex.addItem({ () -> SelectDateRangeView in 
                    let view = SelectDateRangeView(frame: .zero)
                    self.range = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    return view
                }()
                ).margin(0, 0, 0, 0).grow(1.0).shrink(1.0).alignSelf(.stretch)
                
            }
            return view
        }()
        
        xmlRoot = result
        return result
    }
    
}