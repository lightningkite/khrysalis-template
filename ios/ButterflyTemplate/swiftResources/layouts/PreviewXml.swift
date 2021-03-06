//
// PreviewXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class PreviewXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.viewName = view
            view.font = UIFont.get(size: 16.0, style: [])
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
            view.textAlignment = .center
            view.baselineAdjustment = .alignCenters
        }
        
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: ViewPagerLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.pager = view
            applyColor(view, R.color.white) { (c, s) in
                view.backgroundColor = c
            }
            view.canCancelContentTouches = false
            view.showsHorizontalScrollIndicator = false
            view.backgroundColor = .clear
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var viewName: UILabel!
    public unowned var pager: UICollectionView!
    
}
