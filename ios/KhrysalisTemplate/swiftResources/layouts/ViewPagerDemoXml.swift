//
// ViewPagerDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class ViewPagerDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: ViewPagerLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
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
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .bottomCenter
        ) { view in 
            self.viewPagerIndicator = view
            applyColor(view, R.color.colorPrimary) { c in
                view.currentPageIndicatorTintColor = c
            }
            view.pageIndicatorTintColor = UIColor(argb: 0xFF888888)
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var viewPagerIndicator: UIPageControl!
    public unowned var viewPager: UICollectionView!
    
}
