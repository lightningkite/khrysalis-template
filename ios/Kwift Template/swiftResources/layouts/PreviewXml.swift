//
// PreviewXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class PreviewXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 8, left: 0 + 8, bottom: 0 + 8, right: 0 + 8),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.viewName = view
            view.font = UIFont.get(size: 16, style: [])
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
            view.textAlignment = .center
            view.baselineAdjustment = .alignCenters
        }
        
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: ViewPagerLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0 + 0, left: 0 + 0, bottom: 0 + 0, right: 0 + 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.pager = view
            view.backgroundColor = ResourcesColors.white
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
