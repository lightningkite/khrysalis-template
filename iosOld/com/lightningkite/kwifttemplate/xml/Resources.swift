//
//  Resources.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/20/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit

public enum ResourcesBackground {
    static func apply(_ view: UIView, _ key: String) {
        switch(key){
            
        case "button_primary":
            view.backgroundColor = ResourcesColors.colorPrimary
            view.layer.cornerRadius = 3
            
        case "button_accent":
            view.backgroundColor = ResourcesColors.colorAccent
            view.layer.cornerRadius = 3
            
        case "border":
            view.layer.borderWidth = 1
            view.layer.backgroundColor = UIColor.white.cgColor
            view.layer.borderColor = ResourcesColors.disabled.cgColor
            view.layer.cornerRadius = 3
            
        case "spinner_background":
            view.layer.borderWidth = 1
            view.layer.backgroundColor = UIColor.white.cgColor
            view.layer.borderColor = ResourcesColors.disabled.cgColor
            view.layer.cornerRadius = 3
            let arrowImage = UIImage(named: "arrow_drop_down")?.cgImage!
            let arrowLayer = CALayer()
            view.addOnLayoutSubviews { [weak view] in
                guard let view = view else { return }
                if view.frame.size.width > 1 {
                    arrowLayer.isHidden = false
                    arrowLayer.frame = CGRect(x: view.frame.size.width - 32, y: view.frame.size.height / 2 - 8, width: 16, height: 16)
                } else {
                    arrowLayer.isHidden = true
                }
            }
            arrowLayer.contents = arrowImage
            view.layer.masksToBounds = true
            arrowLayer.contentsGravity = .resizeAspect
            view.layer.addSublayer(arrowLayer)
            
        case "edit_text_background":
            let width = 1
            
            let lineView = UIView()
            lineView.backgroundColor = ResourcesColors.disabled
            lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
            view.addSubview(lineView)
            
            let metrics = ["width" : NSNumber(value: width)]
            let views = ["lineView" : lineView]
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            
            if let view = view as? UITextField {
                weak var weakLineView = lineView
                view.addAction(for: .editingDidBegin){
                    weakLineView?.backgroundColor = ResourcesColors.colorPrimary
                }
                view.addAction(for: .editingDidEnd){
                    weakLineView?.backgroundColor = ResourcesColors.disabled
                }
            }

        default: break
        }
    }
}

