//
// RowTextXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class RowTextXml {
    
    unowned var label: UILabel!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let result = { () -> UILabel in 
            let view = UILabel(frame: .zero)
            self.label = view
            view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.numberOfLines = 0
            view.font = UIFont.get(size: 16, style: [])
            view.textColor = UIColor(argb: 0xFF222222)
            return view
        }()
        
        xmlRoot = result
        return result
    }
    
}