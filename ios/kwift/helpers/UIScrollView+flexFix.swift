//
//  UIScrollView+flexFix.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 6/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


extension UIScrollView {
    func flexFix(_ sub: UIView, _ xml: XmlView){
        let dg = ScrollSavingDelegate()
        delegate = dg
        xml.onLayoutSubviews.addWeak(self, sub){ view, sub, _ in
            view.contentSize = sub.frame.size
            view.contentOffset = dg.lastNonzeroOffset
        }
    }
}
