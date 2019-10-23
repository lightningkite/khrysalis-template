//
// ViewPagerDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift

class ViewPagerDemoXml {
    
    unowned var xmlRoot: UIView!
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: ViewPagerLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
            gravity: .fillFill
        ) { view in 
            self.viewPager = view
            view.canCancelContentTouches = false
            view.showsHorizontalScrollIndicator = false
            view.backgroundColor = .clear
        }
        
        view.addSubview(
            UIPageControl(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 8 + 0, left: 8 + 0, bottom: 8 + 0, right: 8 + 0),
            gravity: .bottomCenter
        ) { view in 
            self.viewPagerIndicator = view
            view.currentPageIndicatorTintColor = ResourcesColors.colorPrimary
            view.pageIndicatorTintColor = UIColor(argb: 0xFF888888)
        }
        
        xmlRoot = view
        return view
    }
    
    unowned var viewPagerIndicator: UIPageControl!
    unowned var viewPager: UICollectionView!
    
}
