//
//  onLayoutSubviewsSwizzle.swift
//  KwiftTemplate
//
//  Created by Joseph Ivie on 8/6/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    private static let theSwizzler: Void = {
        let instance = UIView(frame: .zero)
        let aClass: AnyClass! = object_getClass(instance)
        let originalMethod = class_getInstanceMethod(aClass, #selector(layoutSubviews))
        let swizzledMethod = class_getInstanceMethod(aClass, #selector(swizzled_layoutSubviews))
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            // switch implementation..
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }()
    public static func useLayoutSubviewsLambda() {
        _ = theSwizzler
    }
    
    private class LambdaBox {
        var lambda: ()->Void = {}
    }
    private static var table = NSMapTable<UIView, LambdaBox>(keyOptions: .weakMemory, valueOptions: .strongMemory)
    var onLayoutSubviews: (()->Void)? {
        get {
            return UIView.table.object(forKey: self)?.lambda
        }
        set(value) {
            if let value = value {
                let box = LambdaBox()
                box.lambda = value
                UIView.table.setObject(box, forKey: self)
            } else {
                UIView.table.removeObject(forKey: self)
            }
        }
    }
    
    func addOnLayoutSubviews(action:@escaping ()->Void) {
        let old = onLayoutSubviews
        onLayoutSubviews = {
            old?()
            action()
        }
    }
    
    @objc func swizzled_layoutSubviews(){
        self.swizzled_layoutSubviews()
        self.onLayoutSubviews?()
    }
    
    
}
