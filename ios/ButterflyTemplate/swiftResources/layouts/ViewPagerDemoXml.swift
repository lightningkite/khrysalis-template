//
// ViewPagerDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class ViewPagerDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = FrameLayout(frame: .zero)
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: ViewPagerLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
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
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .bottomCenter
        ) { view in 
            self.viewPagerIndicator = view
            applyColor(view, R.color.colorPrimary) { (c, s) in
                view.currentPageIndicatorTintColor = c
            }
            view.pageIndicatorTintColor = UIColor(argb: 0xFF888888)
        }
        
        xmlRoot = view
        return view
    }
    
    public var _viewPager: UICollectionView!
    public var viewPager: UICollectionView { get { return _viewPager } set(value){ _viewPager = value } }
    public var _viewPagerIndicator: UIPageControl!
    public var viewPagerIndicator: UIPageControl { get { return _viewPagerIndicator } set(value){ _viewPagerIndicator = value } }
    
}
