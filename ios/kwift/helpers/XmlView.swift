//
//  LayoutCallbackView.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


class XmlView : UIView {
    var onLayoutSubviews = Event<Void>()
    weak var root: UIView! {
        willSet(newValue) {
            root?.removeFromSuperview()
            if let newValue = newValue {
                self.addSubview(newValue)
//                self.flex.direction(.column).alignContent(.stretch).alignItems(.stretch).addItem(newValue)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        root.pin.top().left().right().bottom()
        root?.flex.layout(mode: .fitContainer)
//        self.flex.layout(mode: .fitContainer)
        onLayoutSubviews.invokeAll(())
    }
}


/*
import Foundation
import UIKit

 class XmlView : UIView {
 var onLayoutSubviews = Event<Void>()
 weak var root: UIView! {
 willSet(newValue) {
 root?.removeFromSuperview()
 if let newValue = newValue {
 addSubview(newValue)
 }
 }
 }
 
 override func layoutSubviews() {
 super.layoutSubviews()
 root.pin.top().left().right().bottom()
 //        self.flex.layout(mode: .fitContainer)
 root?.flex.layout(mode: .fitContainer)
 onLayoutSubviews.invokeAll(())
 }
 }

class XmlView : UIView {
    var onLayoutSubviews = Event<Void>()
    weak var root: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        root.pin.top().left().right().bottom()
        root.flex.layout(mode: .fitContainer)
        onLayoutSubviews.invokeAll(())
    }
}
*/
