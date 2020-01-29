//
// MainXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class MainXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.backgroundColor = ResourcesColors.white
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
            view.backgroundColor = ResourcesColors.colorPrimary
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
                view.iconLayer = ResourcesDrawables.icArrowBackWhite24dp(view)
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
                view.textString = ResourcesStrings.appName
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
        
        xmlRoot = view
        return view
    }
    
    public unowned var mainBack: UIButtonWithLayer!
    public unowned var mainContent: SwapView!
    public unowned var title: UILabel!
    
}
