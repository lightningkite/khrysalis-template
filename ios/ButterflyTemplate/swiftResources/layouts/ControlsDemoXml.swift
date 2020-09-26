//
// ControlsDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class ControlsDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 24.0, style: ["bold"])
                view.textString = R.string.welcome_to_switch_town
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                LabeledSwitch(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.verticalAlign = .start
                view.labelView.font = UIFont.get(size: 12, style: [])
                view.labelView.textString = R.string.lorem_ipsum
                view.labelView.numberOfLines = 0
                view.labelView.baselineAdjustment = .none
            }
            
            view.addSubview(
                LabeledCheckbox(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.verticalAlign = .start
                view.labelView.font = UIFont.get(size: 12, style: [])
                view.labelView.textString = R.string.lorem_ipsum
                view.labelView.numberOfLines = 0
                view.labelView.baselineAdjustment = .none
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
                    size: CGSize(width: 0.0, height: 0),
                    margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "Test Check"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    LabeledCheckbox(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    view.verticalAlign = .start
                    view.labelView.font = UIFont.get(size: 12, style: [])
                    view.labelView.numberOfLines = 0
                    view.labelView.baselineAdjustment = .none
                }
                
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = R.string.text_field
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextFieldPadded(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40.0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.editableText = view
                view.backgroundDrawable = R.drawable.border
                view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextFieldPadded(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40.0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.numberText = view
                view.backgroundDrawable = R.drawable.border
                view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                view.autocapitalizationType = .none
                view.keyboardType = .numberPad
                view.addDismissButton()
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UIAutoCompleteTextFieldPadded(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40.0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.editableAutoText = view
                view.backgroundDrawable = R.drawable.border
                view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.editableTextCopy = view
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = ""
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 100.0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.editableTextBig = view
                view.backgroundDrawable = R.drawable.border
                view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
                view.addDismissButton()
            }
            
            view.addSubview(
                Dropdown(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.spinner = view
                view.backgroundDrawable = R.drawable.border
                view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var editableText: UITextFieldPadded!
    public unowned var numberText: UITextFieldPadded!
    public unowned var editableAutoText: UIAutoCompleteTextFieldPadded!
    public unowned var editableTextCopy: UILabel!
    public unowned var editableTextBig: UITextView!
    public unowned var spinner: Dropdown!
    
}
