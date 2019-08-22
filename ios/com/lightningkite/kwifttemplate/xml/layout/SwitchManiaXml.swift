//
// SwitchManiaXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class SwitchManiaXml {
    
    weak var editableText: UITextField!
    weak var editableTextCopy: UILabel!
    weak var recyclerView: UITableView!
    weak var editableTextBig: UITextView!
    weak var spinner: Dropdown!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIView in 
            let view = UIView(frame: .zero)
            view.flex.direction(.column).padding(8, 8, 8, 8).alignContent(.start).justifyContent(.start).define{ (flex) in 
                flex.addItem({ () -> UILabel in 
                    let view = UILabel(frame: .zero)
                    view.text = ResourcesStrings.welcomeToSwitchTown
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 24, style: ["bold"])
                    view.textColor = UIColor(argb: 0xFF000000)
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.start)
                
                flex.addItem({ () -> LabeledSwitch in 
                    let view = LabeledSwitch(frame: .zero)
                    view.labelView.text = ResourcesStrings.iMASwitch
                    view.labelView.numberOfLines = 0
                    view.labelView.font = UIFont.get(size: 12, style: [])
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.stretch)
                
                flex.addItem({ () -> LabeledSwitch in 
                    let view = LabeledSwitch(frame: .zero)
                    view.labelView.text = ResourcesStrings.iMASwitch
                    view.labelView.numberOfLines = 0
                    view.labelView.font = UIFont.get(size: 12, style: [])
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.stretch)
                
                flex.addItem({ () -> UILabel in 
                    let view = UILabel(frame: .zero)
                    view.text = ResourcesStrings.textField
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.start)
                
                flex.addItem({ () -> UITextField in 
                    let view = UITextField(frame: .zero)
                    self.editableText = view
                    if let image = UIImage(named: "border") {
                        view.backgroundColor = UIColor(patternImage: image)
                    } else {
                        ResourcesBackground.apply(view, "border")
                    }
                    view.setLeftPaddingPoints(8)
                    view.setRightPaddingPoints(8)
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.stretch)
                
                flex.addItem({ () -> UILabel in 
                    let view = UILabel(frame: .zero)
                    self.editableTextCopy = view
                    view.text = ""
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                    return view
                }()
                ).margin(8, 8, 8, 8).alignSelf(.start)
                
                flex.addItem({ () -> UITextView in 
                    let view = UITextView(frame: .zero)
                    self.editableTextBig = view
                    if let image = UIImage(named: "border") {
                        view.backgroundColor = UIColor(patternImage: image)
                    } else {
                        ResourcesBackground.apply(view, "border")
                    }
                    view.setLeftPaddingPoints(8)
                    view.setRightPaddingPoints(8)
                    view.numberOfLines = 0
                    view.font = UIFont.get(size: 16, style: [])
                    view.textColor = UIColor(argb: 0xFF222222)
                    return view
                }()
                ).margin(8, 8, 8, 8).height(100).alignSelf(.stretch)
                
                flex.addItem({ () -> Dropdown in 
                    let view = Dropdown(frame: .zero)
                    self.spinner = view
                    if let image = UIImage(named: "border") {
                        view.backgroundColor = UIColor(patternImage: image)
                    } else {
                        ResourcesBackground.apply(view, "border")
                    }
                    return view
                }()
                ).margin(8, 8, 8, 8).height(50).alignSelf(.stretch)
                
                flex.addItem({ () -> UITableView in 
                    let view = UITableView(frame: .zero)
                    self.recyclerView = view
                    return view
                }()
                ).margin(8, 8, 8, 8).grow(1).shrink(1).height(0).alignSelf(.stretch)
                
            }
            return view
        }()
        
    }
}