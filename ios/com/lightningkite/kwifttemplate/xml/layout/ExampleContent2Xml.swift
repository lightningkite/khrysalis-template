//
// ExampleContent2Xml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class ExampleContent2Xml {
    
    
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIScrollView in 
            let view = UIScrollView(frame: .zero)
            view.flex.direction(.column).alignContent(.center).addItem({
                let sub = { () -> UIView in 
                    let view = UIView(frame: .zero)
                    view.flex.direction(.column).padding(8, 8, 8, 8).alignContent(.start).justifyContent(.start).define{ (flex) in 
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            view.text = ResourcesStrings.youMadeItToAnotherScreen
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 16, style: [])
                            view.textColor = UIColor(argb: 0xFF222222)
                            return view
                        }()
                        ).margin(0, 0, 0, 0).alignSelf(.start)
                        
                    }
                    return view
                }()
                
                let dg = ScrollSavingDelegate()
                view.delegate = dg
                view.addOnLayoutSubviews { [weak view, weak sub] in
                    if let view = view, let sub = sub {
                        view.contentSize = sub.frame.size
                        view.contentOffset = dg.lastNonzeroOffset
                    }
                }
                
                return sub
            }()
            ).shrink(0)
            return view
        }()
        
    }
}