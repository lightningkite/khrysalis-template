//
// ControlsDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class ControlsDemoXml {
    
    unowned var editableText: UITextField!
    unowned var editableTextCopy: UILabel!
    unowned var editableTextBig: UITextView!
    unowned var spinner: Dropdown!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = UIScrollView(frame: .zero)
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addVerticalSubview(LinearLayout(frame: .zero)) { view in 
            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.text = ResourcesStrings.welcomeToSwitchTown
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                LabeledSwitch(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.labelView.text = ResourcesStrings.iMASwitch
                view.labelView.numberOfLines = 0
                view.labelView.font = UIFont.get(size: 12, style: [])
            }
            
            view.addSubview(
                LabeledCheckbox(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.labelView.text = ResourcesStrings.iMASwitch
                view.labelView.numberOfLines = 0
                view.labelView.font = UIFont.get(size: 12, style: [])
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.text = ResourcesStrings.textField
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
                self.editableText = view
                view.backgroundLayer = ResourcesDrawables.border(view: view)
                view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.editableTextCopy = view
                view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                view.text = ""
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITextView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 100),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.editableTextBig = view
                view.backgroundLayer = ResourcesDrawables.border(view: view)
                view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                view.setLeftPaddingPoints(8)
                view.setRightPaddingPoints(8)
                view.numberOfLines = 0
                view.font = UIFont.get(size: 16, style: [])
                view.textColor = UIColor(argb: 0xFF222222)
                view.addDismissButton()
            }
            
            view.addSubview(
                Dropdown(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 50),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.spinner = view
                view.backgroundLayer = ResourcesDrawables.border(view: view)
                view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            }
            
        }
        
        xmlRoot = view
        return view
    }
    
}