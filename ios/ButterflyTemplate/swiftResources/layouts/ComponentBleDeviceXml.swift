//
// ComponentBleDeviceXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class ComponentBleDeviceXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .x
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .centerCenter
        
        view.addSubview(
            LinearLayout(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.deviceName = view
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.deviceId = view
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
        }
        
        view.addSubview(
            UIView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0.0, height: 8.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .centerCenter,
            weight: 1.0
        ) { view in 
        }
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            self.rssi = view
            view.font = UIFont.get(size: 16.0, style: [])
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UIButtonWithLayer(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets.zero,
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            self.connect = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.connect
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.connect
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        xmlRoot = view
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _deviceName: UILabel!
    public var deviceName: UILabel { get { return _deviceName } set(value){ _deviceName = value } }
    public var _deviceId: UILabel!
    public var deviceId: UILabel { get { return _deviceId } set(value){ _deviceId = value } }
    public var _rssi: UILabel!
    public var rssi: UILabel { get { return _rssi } set(value){ _rssi = value } }
    public var _connect: UIButtonWithLayer!
    public var connect: UIButtonWithLayer { get { return _connect } set(value){ _connect = value } }
    
}
