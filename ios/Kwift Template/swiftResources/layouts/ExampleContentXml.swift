//
// ExampleContentXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift

class ExampleContentXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = UIScrollView(frame: .zero)
        view.addVerticalSubview(LinearLayout(frame: .zero), fill: false) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.text = ResourcesStrings.welcome
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
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
                view.orientation = .x
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.gravity = .centerCenter
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    self.exampleContentNumber = view
                    view.text = "0"
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    self.exampleContentIncrement = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
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
                margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.image = UIImage(named: "reason_expertise") ?? ResourcesDrawables.reasonExpertise(view).toImage()
                view.clipsToBounds = true
                view.contentMode = .scaleAspectFit
            }
            
        }
        xmlRoot = view
        return view
    }
    
    unowned var exampleContentNumber: UILabel!
    unowned var exampleContentIncrement: UIButtonWithLayer!
    
}
