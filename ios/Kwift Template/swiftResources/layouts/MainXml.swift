//
// MainXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class MainXml {
    
    unowned var mainBack: UIButton!
    unowned var mainContent: UIView!
    unowned var title: UILabel!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.backgroundColor = ResourcesColors.white
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        view.addSubview(
            LinearLayout(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.backgroundColor = ResourcesColors.colorPrimary
            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.orientation = .x
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            
            view.addSubview(
                UIButton(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                self.mainBack = view
                view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                view.contentHorizontalAlignment = .center
                view.setImage(UIImage(named: "ic_arrow_back_white_24dp") ?? ResourcesDrawables.icArrowBackWhite24dp(view: view).toImage(), for: .normal)
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.font = UIFont.get(size: 12, style: [])
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .centerCenter,
                weight: 1.0
            ) { view in 
                self.title = view
                view.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
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
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.mainContent = view
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        
        xmlRoot = view
        return view
    }
    
}