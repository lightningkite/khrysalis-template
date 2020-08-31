//
// FloatingHexagonsDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class FloatingHexagonsDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            CustomView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .fillFill
        ) { view in 
            self.customView = view
            applyColor(view, R.color.black) { (c, s) in
                view.backgroundColor = c
            }
            let dg = FloatingHexagonsDelegate()
            view.delegate = dg
            self.customViewDelegate = dg
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var customViewDelegate: FloatingHexagonsDelegate!
    public unowned var customView: CustomView!
    
}
