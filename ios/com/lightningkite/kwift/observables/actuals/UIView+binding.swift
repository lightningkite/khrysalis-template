//
//  UIView+binding.swift
//  KwiftTemplate
//
//  Created by Joseph Ivie on 8/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func bindVisible(_ observable: ObservableProperty<Bool>) {
        return bindVisible(observable: observable)
    }
    func bindVisible(observable: ObservableProperty<Bool>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            this.isHidden = !value
        }
    }
    
    func bindExists(_ observable: ObservableProperty<Bool>) {
        return bindExists(observable: observable)
    }
    func bindExists(observable: ObservableProperty<Bool>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if value {
                this.flex.display(.flex)
            } else {
                this.flex.display(.none)
            }
            this.relayoutFlexClimbToXml()
        }
    }
    
    func relayoutFlexClimbToXml() {
//        if self is XmlView {
//            self.flex.layout()
//        } else {
//            self.superview?.relayoutFlexClimbToXml()
//        }
    }
    
    func bindStack(_ dependency: ViewDependency, _ stack: ObservableStack<ViewGenerator>) {
        return bindStack(dependency: dependency, stack: stack)
    }
    func bindStack(dependency: ViewDependency, stack: ObservableStack<ViewGenerator>) {
        var current: UIView? = nil
        var lastCount = 0
        stack.addAndRunWeak(self) { this, value in
            var multiplier: CGFloat = 1
            var oldFrameEnd: (UIView) -> Void
            var newFrameStart: (UIView) -> Void
            if lastCount > value.count {
                oldFrameEnd = {
                    $0.frame = CGRect(x: this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
                newFrameStart = {
                    $0.frame = CGRect(x: -this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
            } else if lastCount < value.count {
                oldFrameEnd = {
                    $0.frame = CGRect(x: -this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
                newFrameStart = {
                    $0.frame = CGRect(x: this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
            } else {
                oldFrameEnd = {
                    $0.alpha = 0
                }
                newFrameStart = {
                    $0.alpha = 0
                }
            }
            lastCount = value.count
            
            if let old = current {
                UIView.animate(
                    withDuration: 0.25,
                    animations: {
                        oldFrameEnd(old)
                },
                    completion: { done in
                        old.removeFromSuperview()
                }
                )
            }
            if let newData = value.last {
                let new = newData.generate(dependency: ())
                newFrameStart(new)
                this.addSubview(new)
                new.layoutSubviews()
                new.flex.layout()
                UIView.animate(
                    withDuration: 0.25,
                    animations: {
                        new.frame = CGRect(x: 0, y: 0, width: this.frame.width, height: this.frame.height)
                        new.layoutSubviews()
                        new.flex.layout()
                        new.alpha = 1
                }
                )
                current = new
            }
        }
        
//        self.addOnLayoutSubviews { [weak self] in
//            guard let self = self else { return }
//            for v in self.subviews {
//                v.pin.top().left().right().bottom()
//            }
//        }
    }
}
