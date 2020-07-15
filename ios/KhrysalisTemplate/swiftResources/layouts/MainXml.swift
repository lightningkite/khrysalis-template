//
// MainXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class MainXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            LinearLayout(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.topBar = view
            applyColor(view, R.color.colorPrimary) { c in
                view.backgroundColor = c
            }
            view.safeInsets(align: .topFill)
            view.orientation = .x
            view.padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
            view.gravity = .centerCenter
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                self.mainBack = view
                view.titleLabel?.font = UIFont.get(size: 12, style: [])
                view.titleLabel?.numberOfLines = 0
                view.contentHorizontalAlignment = .center
                view.iconPosition = .top
                view.iconLayer = R.drawable.ic_arrow_back_white_24dp(view)
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4),
                gravity: .centerCenter,
                weight: 1.0
            ) { view in 
                self.title = view
                view.font = UIFont.get(size: 18, style: ["bold"])
                view.textString = R.string.app_name
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFFffffff)
            }
            
        }
        
        view.addSubview(
            SwapView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
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
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.bottom0 = view
            applyColor(view, R.color.colorPrimary) { c in
                view.backgroundColor = c
            }
            view.safeInsetsSizing(align: .bottomFill)
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var bottom0: UIView!
    public unowned var mainBack: UIButtonWithLayer!
    public unowned var mainContent: SwapView!
    public unowned var topBar: LinearLayout!
    public unowned var title: UILabel!
    
}
