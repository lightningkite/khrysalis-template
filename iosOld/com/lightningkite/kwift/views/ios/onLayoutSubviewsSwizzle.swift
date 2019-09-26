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
    
    private static var ext = ExtensionProperty<UIView, ()->Void>()
    var onLayoutSubviews: (()->Void)? {
        get {
            return UIView.ext.get(self)
        }
        set(value) {
            UIView.ext.set(self, value)
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
