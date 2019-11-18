//
// LoginDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class LoginDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
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
                view.text = ResourcesStrings.welcomeToSwitchTown
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UITextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.username = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.placeholder = ResourcesStrings.username
                view.autocapitalizationType = .none
                view.textContentType = .emailAddress
                view.keyboardType = .emailAddress
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.password = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.placeholder = ResourcesStrings.password
                view.autocapitalizationType = .none
                view.textContentType = .password
                view.isSecureTextEntry = true
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.verifyPassword = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.placeholder = ResourcesStrings.verifyPassword
                view.autocapitalizationType = .none
                view.textContentType = .password
                view.isSecureTextEntry = true
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                LabeledCheckbox(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.agree = view
                view.labelView.text = ResourcesStrings.iAgree
                view.labelView.numberOfLines = 0
                view.labelView.font = UIFont.get(size: 12, style: [])
            }
            
            view.addSubview(
                ViewFlipper(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.submitLoading = view
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .topFill
                ) { view in 
                    self.submit = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                    view.setTitle(ResourcesStrings.submit, for: .normal)
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                    view.titleLabel?.text = ResourcesStrings.submit
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                }
                
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var verifyPassword: UITextField!
    public unowned var password: UITextField!
    public unowned var submit: UIButtonWithLayer!
    public unowned var submitLoading: ViewFlipper!
    public unowned var agree: LabeledCheckbox!
    public unowned var username: UITextField!
    
}
