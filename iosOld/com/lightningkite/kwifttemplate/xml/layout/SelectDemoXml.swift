//
// SelectDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class SelectDemoXml {
    
    weak var list: UITableView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIView in 
            let view = UIView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).padding(0, 0, 0, 0).alignContent(.start).justifyContent(.start).define{ (flex) in 
                flex.addItem({ () -> UILabel in 
                    let view = UILabel(frame: .zero)
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.text = ResourcesStrings.selectDemo
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 24, style: ["bold"])
                    view.textColor = UIColor(argb: 0xFF000000)
                    view.textAlignment = .center
                    view.baselineAdjustment = .alignCenters
                    return view
                }()
                ).margin(16, 16, 16, 16).alignSelf(.stretch)
                
                flex.addItem({ () -> UITableView in 
                    let view = UITableView(frame: .zero)
                    self.list = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    return view
                }()
                ).margin(0, 0, 0, 0).grow(1).shrink(1).height(0).alignSelf(.stretch)
                
            }
            return view
        }()
        
    }
}