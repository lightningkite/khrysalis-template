//
//  ClosureSleeve.swift
//  PennyProfit
//
//  Created by Joseph Ivie on 1/2/19.
//  Copyright © 2019 Shane Thompson. All rights reserved.
//

import Foundation
import UIKit

class ClosureSleeve {
    let closure: () -> ()
    
    init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    init(closure: @escaping () -> ()) {
        self.closure = closure
    }
    
    @objc func invoke() {
        closure()
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .primaryActionTriggered, action: @escaping () -> ()) {
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
    }
}

extension UIGestureRecognizer {
    func addAction(action: @escaping () -> ()) -> Self {
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke))
        return self
    }
}

extension UIBarButtonItem {
    convenience init(title: String?, style: UIBarButtonItem.Style, action: @escaping () -> ()) {
        let sleeve = ClosureSleeve(closure: action)
        self.init(title: title, style: style, target: sleeve, action: #selector(ClosureSleeve.invoke))
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, .OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIView {
    func retain<T>(as string: String = "[\(arc4random())]", item: T) {
        objc_setAssociatedObject(self, "UIView.retain." + string, item, .OBJC_ASSOCIATION_RETAIN)
    }
}
