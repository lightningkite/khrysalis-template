//
// MainXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class MainXml {
    
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
            LinearLayout(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.topBar = view
            applyColor(view, R.color.colorPrimary) { (c, s) in
                view.backgroundColor = c
            }
            view.safeInsets(align: .topFill)
            view.orientation = .x
            view.padding = UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
            view.gravity = .centerCenter
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                self.mainBack = view
                view.titleLabel?.font = UIFont.get(size: 12, style: [])
                view.titleLabel?.numberOfLines = 0
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
                view.iconPosition = .center
                view.iconLayer = R.drawable.ic_arrow_back_white_24dp.makeLayer(view)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0.0, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0),
                gravity: .centerCenter,
                weight: 1.0
            ) { view in 
                self.title = view
                view.font = UIFont.get(size: 18.0, style: ["bold"])
                view.textString = R.string.app_name
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFFffffff)
            }
            
        }
        
        view.addSubview(
            SwapView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.mainContent = view
        }
        
        view.addSubview(
            UIView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.bottom0 = view
            applyColor(view, R.color.colorPrimary) { (c, s) in
                view.backgroundColor = c
            }
            view.safeInsetsSizing(align: .bottomFill)
        }
        
        xmlRoot = view
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _topBar: LinearLayout!
    public var topBar: LinearLayout { get { return _topBar } set(value){ _topBar = value } }
    public var _mainBack: UIButtonWithLayer!
    public var mainBack: UIButtonWithLayer { get { return _mainBack } set(value){ _mainBack = value } }
    public var _title: UILabel!
    public var title: UILabel { get { return _title } set(value){ _title = value } }
    public var _mainContent: SwapView!
    public var mainContent: SwapView { get { return _mainContent } set(value){ _mainContent = value } }
    public var _bottom0: UIView!
    public var bottom0: UIView { get { return _bottom0 } set(value){ _bottom0 = value } }
    
}
