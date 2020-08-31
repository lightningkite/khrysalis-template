//
// DateRangeDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class DateRangeDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.gravity = .topLeft
            
            view.addSubview(
                CustomView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 350.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.month = view
                applyColor(view, R.color.white) { (c, s) in
                    view.backgroundColor = c
                }
                let dg = MonthCVD()
                view.delegate = dg
                self.monthDelegate = dg
            }
            
            view.addSubview(
                CustomView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 350.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.month2 = view
                applyColor(view, R.color.white) { (c, s) in
                    view.backgroundColor = c
                }
                let dg = SelectDateMonthCVD()
                view.delegate = dg
                self.month2Delegate = dg
            }
            
            view.addSubview(
                CustomView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 350.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.month3 = view
                applyColor(view, R.color.white) { (c, s) in
                    view.backgroundColor = c
                }
                let dg = SelectDateRangeMonthCVD()
                view.delegate = dg
                self.month3Delegate = dg
            }
            
            view.addSubview(
                CustomView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 350.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.month4 = view
                applyColor(view, R.color.white) { (c, s) in
                    view.backgroundColor = c
                }
                let dg = SelectMultipleDatesMonthCVD()
                view.delegate = dg
                self.month4Delegate = dg
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var month2Delegate: SelectDateMonthCVD!
    public unowned var month3Delegate: SelectDateRangeMonthCVD!
    public unowned var monthDelegate: MonthCVD!
    public unowned var month4Delegate: SelectMultipleDatesMonthCVD!
    public unowned var month2: CustomView!
    public unowned var month3: CustomView!
    public unowned var month: CustomView!
    public unowned var month4: CustomView!
    
}
