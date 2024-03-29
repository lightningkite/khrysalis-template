//
// SegmentedControlDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class SegmentedControlDemoXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            UISegmentedControlSquare(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
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
            size: CGSize(width: -1, height: -1),
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
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _tabs: UISegmentedControlSquare!
    public var tabs: UISegmentedControlSquare { get { return _tabs } set(value){ _tabs = value } }
    public var _tabs2: UISegmentedControlSquare!
    public var tabs2: UISegmentedControlSquare { get { return _tabs2 } set(value){ _tabs2 = value } }
    
}
