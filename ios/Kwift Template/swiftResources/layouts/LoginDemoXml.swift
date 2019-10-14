//
// LoginDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class LoginDemoXml {
    
    unowned var verifyPassword: UITextField!
    unowned var password: UITextField!
    unowned var submit: UIButton!
    unowned var agree: LabeledCheckbox!
    unowned var username: UITextField!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let result = { () -> UIScrollView in 
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
                        
                        flex.addItem({ () -> UITextField in 
                            let view = UITextField(frame: .zero)
                            self.username = view
                            view.backgroundLayer = ResourcesDrawables.border(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                            view.setLeftPaddingPoints(8)
                            view.setRightPaddingPoints(8)
                            view.placeholder = ResourcesStrings.username
                            view.autocapitalizationType = .none
                            view.textContentType = .emailAddress
                            view.keyboardType = .emailAddress
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 16, style: [])
                            view.textColor = UIColor(argb: 0xFF222222)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).minHeight(40).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UITextField in 
                            let view = UITextField(frame: .zero)
                            self.password = view
                            view.backgroundLayer = ResourcesDrawables.border(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                            view.setLeftPaddingPoints(8)
                            view.setRightPaddingPoints(8)
                            view.placeholder = ResourcesStrings.password
                            view.autocapitalizationType = .none
                            view.textContentType = .password
                            view.isSecureTextEntry = true
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 16, style: [])
                            view.textColor = UIColor(argb: 0xFF222222)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).minHeight(40).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UITextField in 
                            let view = UITextField(frame: .zero)
                            self.verifyPassword = view
                            view.backgroundLayer = ResourcesDrawables.border(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                            view.setLeftPaddingPoints(8)
                            view.setRightPaddingPoints(8)
                            view.placeholder = ResourcesStrings.verifyPassword
                            view.autocapitalizationType = .none
                            view.textContentType = .password
                            view.isSecureTextEntry = true
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 16, style: [])
                            view.textColor = UIColor(argb: 0xFF222222)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).minHeight(40).alignSelf(.stretch)
                        
                        flex.addItem({ () -> LabeledCheckbox in 
                            let view = LabeledCheckbox(frame: .zero)
                            self.agree = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.labelView.text = ResourcesStrings.iAgree
                            view.labelView.numberOfLines = 0
                            view.labelView.font = UIFont.get(size: 12, style: [])
                            return view
                        }()
                        ).margin(8, 8, 8, 8).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UIButton in 
                            let view = UIButton(frame: .zero)
                            self.submit = view
                            view.backgroundLayer = ResourcesDrawables.buttonPrimary(view: view)
                            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                            view.setTitle(ResourcesStrings.submit, for: .normal)
                            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                            view.contentHorizontalAlignment = .center
                            view.contentMode = .scaleAspectFit
                            view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                            view.titleLabel?.text = ResourcesStrings.submit
                            view.titleLabel?.numberOfLines = 0
                            view.titleLabel?.font = UIFont.get(size: 16, style: [])
                            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                            return view
                        }()
                        ).margin(0, 0, 0, 0).alignSelf(.stretch)
                        
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
        
        xmlRoot = result
        return result
    }
    
}