//
// PongDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class PongDemoXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            CustomView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .centerFill
        ) { view in 
            self.customView = view
            applyColor(view, R.color.black) { (c, s) in
                view.backgroundColor = c
            }
            let dg = PongDelegate()
            view.delegate = dg
            self.customViewDelegate = dg
        }
        
        xmlRoot = view
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _customView: CustomView!
    public var customView: CustomView { get { return _customView } set(value){ _customView = value } }
    public var _customViewDelegate: PongDelegate!
    public var customViewDelegate: PongDelegate { get { return _customViewDelegate } set(value) { _customViewDelegate = value } }
    
}
