//
// RowTestXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class RowTestXml {
    
    weak var button: UIButton!
    weak var label: UILabel!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIView in 
            let view = UIView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.flex.direction(.row).padding(8, 8, 8, 8).alignContent(.center).justifyContent(.center).define{ (flex) in 
                flex.addItem({ () -> UILabel in 
                    let view = UILabel(frame: .zero)
                    self.label = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.text = ResourcesStrings.welcomeToSwitchTown
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                    return view
                }()
                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).alignSelf(.center)
                
                flex.addItem({ () -> UIButton in 
                    let view = UIButton(frame: .zero)
                    self.button = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view: view)
                    view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                    view.setTitle(ResourcesStrings.ok, for: .normal)
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                    view.titleLabel?.text = ResourcesStrings.ok
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.center)
                
            }
            return view
        }()
        
    }
    
}