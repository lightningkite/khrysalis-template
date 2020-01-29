//
// ExampleContentXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class ExampleContentXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textString = ResourcesStrings.welcome
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16, style: [])
                view.textString = ResourcesStrings.welcomeMessage
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                LinearLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
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
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    self.exampleContentNumber = view
                    view.font = UIFont.get(size: 16, style: [])
                    view.textString = "0"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    self.exampleContentIncrement = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = ResourcesStrings.incrementTheNumber
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = ResourcesStrings.incrementTheNumber
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                }
                
            }
            
            view.addSubview(
                LinearLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
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
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    self.chainedNumber = view
                    view.font = UIFont.get(size: 16, style: [])
                    view.textString = "0"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    self.chainedIncrement = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = ResourcesStrings.incrementTheNumber
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = ResourcesStrings.incrementTheNumber
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                }
                
            }
            
            view.addSubview(
                UIImageView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 100, height: 50),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
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
    
    public unowned var chainedNumber: UILabel!
    public unowned var chainedIncrement: UIButtonWithLayer!
    public unowned var exampleContentNumber: UILabel!
    public unowned var exampleContentIncrement: UIButtonWithLayer!
    
}
