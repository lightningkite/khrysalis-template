//
// DateRangeDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift

class DateRangeDemoXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            SelectDayView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.select = view
        }
        
        view.addSubview(
            SelectDateRangeView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.range = view
        }
        
        xmlRoot = view
        return view
    }
    
    unowned var select: SelectDayView!
    unowned var range: SelectDateRangeView!
    
}
