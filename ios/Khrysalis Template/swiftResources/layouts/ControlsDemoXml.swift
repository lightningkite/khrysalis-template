//
// ControlsDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class ControlsDemoXml {
    
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
                view.textString = ResourcesStrings.welcomeToSwitchTown
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                LabeledSwitch(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.verticalAlign = .start
                view.labelView.font = UIFont.get(size: 12, style: [])
                view.labelView.textString = ResourcesStrings.loremIpsum
                view.labelView.numberOfLines = 0
                view.labelView.baselineAdjustment = .none
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
                view.verticalAlign = .start
                view.labelView.font = UIFont.get(size: 12, style: [])
                view.labelView.textString = ResourcesStrings.loremIpsum
                view.labelView.numberOfLines = 0
                view.labelView.baselineAdjustment = .none
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
                view.textString = ResourcesStrings.textField
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
                self.editableText = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UIAutoCompleteTextField(frame: .zero),
                minimumSize: CGSize(width: 0, height: 40),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.editableAutoText = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.editableTextCopy = view
                view.font = UIFont.get(size: 16, style: [])
                view.textString = ""
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 100),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.editableTextBig = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
                view.addDismissButton()
            }
            
            view.addSubview(
                Dropdown(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.spinner = view
                view.backgroundLayer = ResourcesDrawables.border(view)
                view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var editableText: UITextField!
    public unowned var editableTextCopy: UILabel!
    public unowned var editableAutoText: UIAutoCompleteTextField!
    public unowned var editableTextBig: UITextView!
    public unowned var spinner: Dropdown!
    
}