//
// MainXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift

class MainXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
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
                margin: UIEdgeInsets(top: 0 + 8, left: 0 + 8, bottom: 0 + 8, right: 0 + 8),
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                self.mainBack = view
                view.contentHorizontalAlignment = .center
                view.iconPosition = .top
                view.iconLayer = ResourcesDrawables.icArrowBackWhite24dp(view)
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.font = UIFont.get(size: 12, style: [])
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0 + 4, left: 0 + 4, bottom: 0 + 4, right: 0 + 4),
                gravity: .centerCenter,
                weight: 1.0
            ) { view in 
                self.title = view
                view.text = ResourcesStrings.appName
                view.numberOfLines = 0
                view.font = UIFont.get(size: 18, style: ["bold"])
                view.textColor = UIColor(argb: 0xFFffffff)
            }
            
        }
        
        view.addSubview(
            UIView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.mainContent = view
        }
        
        xmlRoot = view
        return view
    }
    
    unowned var mainBack: UIButtonWithLayer!
    unowned var mainContent: UIView!
    unowned var title: UILabel!
    
}
