//
// PongDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class PongDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            CustomView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
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
        return view
    }
    
    public unowned var customView: CustomView!
    public unowned var customViewDelegate: PongDelegate!
    
}
