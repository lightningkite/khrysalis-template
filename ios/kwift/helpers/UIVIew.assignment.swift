//
//  UIVIew.assignment.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/20/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


infix operator ^=: AssignmentPrecedence
extension UIView {
    static func ^= (lhs: inout UIView, rhs: UIView) -> UIView {
        lhs = rhs
        return rhs
    }
}
