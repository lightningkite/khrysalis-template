//
// DateRangeDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class DateRangeDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            SelectDateRangeView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.range = view
        }
        
        view.addSubview(
            CustomView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.month = view
            view.backgroundColor = ResourcesColors.white
            let dg = MonthCVD()
            view.delegate = dg
            self.monthDelegate = dg
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var monthDelegate: MonthCVD!
    public unowned var month: CustomView!
    public unowned var range: SelectDateRangeView!
    
}
