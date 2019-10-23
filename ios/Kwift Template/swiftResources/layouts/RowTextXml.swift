//
// RowTextXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift

class RowTextXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = UILabel(frame: .zero)
        self.label = view
        view.numberOfLines = 0
        view.font = UIFont.get(size: 16, style: [])
        view.textColor = UIColor(argb: 0xFF222222)
        xmlRoot = view
        return view
    }
    
    unowned var label: UILabel!
    
}
