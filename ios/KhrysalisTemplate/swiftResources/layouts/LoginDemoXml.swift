//
// LoginDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class LoginDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
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
                view.textString = R.string.welcome_to_switch_town
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UITextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.username = view
                view.backgroundLayer = R.drawable.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.placeholder = R.string.username
                view.autocapitalizationType = .none
                view.textContentType = .emailAddress
                view.keyboardType = .emailAddress
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.password = view
                view.backgroundLayer = R.drawable.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.placeholder = R.string.password
                view.autocapitalizationType = .none
                view.textContentType = .password
                view.isSecureTextEntry = true
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.verifyPassword = view
                view.backgroundLayer = R.drawable.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.placeholder = R.string.verify_password
                view.autocapitalizationType = .none
                view.textContentType = .password
                view.isSecureTextEntry = true
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                LabeledCheckbox(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.agree = view
                view.labelView.font = UIFont.get(size: 12, style: [])
                view.labelView.textString = R.string.i_agree
                view.labelView.numberOfLines = 0
            }
            
            view.addSubview(
                ViewFlipper(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
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
                    padding: UIEdgeInsets.zero,
                    gravity: .topFill
                ) { view in 
                    self.submit = view
                    view.backgroundLayer = R.drawable.button_primary(view)
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = R.string.submit
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = R.string.submit
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
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
