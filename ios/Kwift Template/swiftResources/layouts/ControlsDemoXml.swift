//
// ControlsDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class ControlsDemoXml {
    
    weak var editableText: UITextField!
    weak var editableTextCopy: UILabel!
    weak var editableTextBig: UITextView!
    weak var spinner: Dropdown!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIScrollView in 
            let view = UIScrollView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).alignContent(.center).addItem({
                let sub = { () -> UIView in 
                    let view = UIView(frame: .zero)
                    view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                    view.flex.direction(.column).padding(8, 8, 8, 8).alignContent(.start).justifyContent(.start).define{ (flex) in 
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.text = ResourcesStrings.welcomeToSwitchTown
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 24, style: ["bold"])
                            view.textColor = UIColor(argb: 0xFF000000)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).alignSelf(.start)
                        
                        flex.addItem({ () -> LabeledSwitch in 
                            let view = LabeledSwitch(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.labelView.text = ResourcesStrings.iMASwitch
                            view.labelView.numberOfLines = 0
                            view.labelView.font = UIFont.get(size: 12, style: [])
                            return view
                        }()
                        ).margin(8, 8, 8, 8).alignSelf(.stretch)
                        
                        flex.addItem({ () -> LabeledCheckbox in 
                            let view = LabeledCheckbox(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.labelView.text = ResourcesStrings.iMASwitch
                            view.labelView.numberOfLines = 0
                            view.labelView.font = UIFont.get(size: 12, style: [])
                            return view
                        }()
                        ).margin(8, 8, 8, 8).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
                            view.backgroundLayer = ResourcesDrawables.border(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                            view.setLeftPaddingPoints(8)
                            view.setRightPaddingPoints(8)
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 16, style: [])
                            view.textColor = UIColor(argb: 0xFF222222)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).minHeight(40).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            self.editableTextCopy = view
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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
                            view.backgroundLayer = ResourcesDrawables.border(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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
                            view.backgroundLayer = ResourcesDrawables.border(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).height(50).alignSelf(.stretch)
                        
                    }
                    return view
                }()
                
                let dg = ScrollSavingDelegate()
                view.delegate = dg
                view.addOnLayoutSubviews { [weak view, weak sub] in
                    if let view = view, let sub = sub {
                        view.contentSize = sub.frame.size
                        view.contentOffset = dg.lastNonzeroOffset
                    }
                }
                
                return sub
            }()
            ).shrink(0)
            return view
        }()
        
    }
    
}