//
// ExampleContentXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class ExampleContentXml {
    
    unowned var exampleContentNumber: UILabel!
    unowned var exampleContentIncrement: UIButton!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = UIScrollView(frame: .zero)
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addVerticalSubview(LinearLayout(frame: .zero)) { view in 
            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.text = ResourcesStrings.welcome
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.text = ResourcesStrings.welcomeMessage
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                LinearLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.orientation = .x
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    self.exampleContentNumber = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.text = "0"
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UIButton(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    self.exampleContentIncrement = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view: view)
                    view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                    view.setTitle(ResourcesStrings.incrementTheNumber, for: .normal)
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                    view.titleLabel?.text = ResourcesStrings.incrementTheNumber
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                }
                
            }
            
            view.addSubview(
                UIImageView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 100, height: 50),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.image = UIImage(named: "reason_expertise") ?? ResourcesDrawables.reasonExpertise(view: view).toImage()?.withInset(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                view.contentMode = .scaleAspectFit
            }
            
        }
        
        xmlRoot = view
        return view
    }
    
}