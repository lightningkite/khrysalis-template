//
// ViewPagerDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class ViewPagerDemoXml {
    
    weak var viewPagerIndicator: UIPageControl!
    weak var viewPager: UICollectionView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIView in 
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
                        sub.pin.width(100%).height(100%)
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
                        sub.pin.width(sub.intrinsicContentSize.width).height(sub.intrinsicContentSize.height).hCenter().bottom(8 + 0)
                    }
                }
                return sub
            }())
            
            return view
        }()
        
    }
    
}