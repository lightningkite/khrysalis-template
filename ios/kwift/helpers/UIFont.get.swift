//
//  UIFont.get.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/20/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


extension UIFont {
    
    static func list() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    static var customFont: String?
    
    static func get(size: Int, style: Array<String>) -> UIFont {
        let actualSize: CGFloat = CGFloat(size)
        if style.contains("bold") {
            if style.contains("italic") {
                if let customFont = customFont {
                    return UIFont(name: "\(customFont)-BoldItalic", size: actualSize) ?? UIFont.boldSystemFont(ofSize: actualSize)
                } else {
                    return UIFont.boldSystemFont(ofSize: actualSize)
                }
            } else {
                if let customFont = customFont {
                    return UIFont(name: "\(customFont)-Bold", size: actualSize) ?? UIFont.boldSystemFont(ofSize: actualSize)
                } else {
                    return UIFont.boldSystemFont(ofSize: actualSize)
                }
            }
        } else {
            if style.contains("italic") {
                if let customFont = customFont {
                    return UIFont(name: "\(customFont)-Italic", size: actualSize) ?? UIFont.italicSystemFont(ofSize: actualSize)
                } else {
                    return UIFont.italicSystemFont(ofSize: actualSize)
                }
            } else {
                if let customFont = customFont {
                    return UIFont(name: "\(customFont)-Regular", size: actualSize) ?? UIFont.systemFont(ofSize: actualSize)
                } else {
                    return UIFont.systemFont(ofSize: actualSize)
                }
            }
        }
    }
}
