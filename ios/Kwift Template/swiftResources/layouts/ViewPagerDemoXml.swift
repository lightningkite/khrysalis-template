//
// ViewPagerDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class ViewPagerDemoXml {
    
    unowned var viewPagerIndicator: UIPageControl!
    unowned var viewPager: UICollectionView!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let result = { () -> UIView in 
            let view = UIView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.addSubview({
                let sub = { () -> UICollectionView in 
                    let view = UICollectionView(frame: .zero, collectionViewLayout: ViewPagerLayout())
                    self.viewPager = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.canCancelContentTouches = false
                    view.showsHorizontalScrollIndicator = false
                    view.backgroundColor = .clear
                    return view
                }()
                
                view.addOnLayoutSubviews { [weak view, weak sub] in
                    if let view = view, let sub = sub {
                        sub.pin.left(0 + 0).right(0 + 0).top(0 + 0).bottom(0 + 0)
                    }
                }
                return sub
            }())
            
            view.addSubview({
                let sub = { () -> UIPageControl in 
                    let view = UIPageControl(frame: .zero)
                    self.viewPagerIndicator = view
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.currentPageIndicatorTintColor = ResourcesColors.colorPrimary
                    view.pageIndicatorTintColor = UIColor(argb: 0xFF888888)
                    return view
                }()
                
                view.addOnLayoutSubviews { [weak view, weak sub] in
                    if let view = view, let sub = sub {
                        sub.flex.layout(mode: .adjustWidth)
                        sub.flex.layout(mode: .adjustHeight)
                        sub.pin.hCenter((-8 + 8) / 2).bottom(8 + 0)
                    }
                }
                return sub
            }())
            
            return view
        }()
        
        xmlRoot = result
        return result
    }
    
}