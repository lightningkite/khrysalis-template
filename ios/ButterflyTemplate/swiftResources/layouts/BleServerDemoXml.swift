//
// BleServerDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class BleServerDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 24.0, style: ["bold"])
                view.textString = R.string.welcome_to_switch_town
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.info = view
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextFieldPadded(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.utfValue = view
                view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                view.backgroundLayer = view.underlineLayer(boldColor: UIColor(argb: 0xFF222222), hintColor: nil)
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = ""
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public var _info: UILabel!
    public var info: UILabel { get { return _info } set(value){ _info = value } }
    public var _utfValue: UITextFieldPadded!
    public var utfValue: UITextFieldPadded { get { return _utfValue } set(value){ _utfValue = value } }
    
}
