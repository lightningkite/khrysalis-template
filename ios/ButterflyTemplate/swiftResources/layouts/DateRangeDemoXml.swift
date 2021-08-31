//
// DateRangeDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class DateRangeDemoXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.gravity = .topLeft
            
            view.addSubview(
                CustomView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 350.0),
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
                size: CGSize(width: -1, height: 350.0),
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
                size: CGSize(width: -1, height: 350.0),
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
                size: CGSize(width: -1, height: 350.0),
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
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _month: CustomView!
    public var month: CustomView { get { return _month } set(value){ _month = value } }
    public var _month2: CustomView!
    public var month2: CustomView { get { return _month2 } set(value){ _month2 = value } }
    public var _month3: CustomView!
    public var month3: CustomView { get { return _month3 } set(value){ _month3 = value } }
    public var _month4: CustomView!
    public var month4: CustomView { get { return _month4 } set(value){ _month4 = value } }
    public var _monthDelegate: MonthCVD!
    public var monthDelegate: MonthCVD { get { return _monthDelegate } set(value) { _monthDelegate = value } }
    public var _month2Delegate: SelectDateMonthCVD!
    public var month2Delegate: SelectDateMonthCVD { get { return _month2Delegate } set(value) { _month2Delegate = value } }
    public var _month3Delegate: SelectDateRangeMonthCVD!
    public var month3Delegate: SelectDateRangeMonthCVD { get { return _month3Delegate } set(value) { _month3Delegate = value } }
    public var _month4Delegate: SelectMultipleDatesMonthCVD!
    public var month4Delegate: SelectMultipleDatesMonthCVD { get { return _month4Delegate } set(value) { _month4Delegate = value } }
    
}
