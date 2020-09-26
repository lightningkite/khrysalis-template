//
// MultipleDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class MultipleDemoXml {
    
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
            margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.font = UIFont.get(size: 24.0, style: ["bold"])
            view.textString = R.string.check_out_my_multiple_rows
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF000000)
            view.textAlignment = .center
            view.baselineAdjustment = .alignCenters
        }
        
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: UICollectionView.ReversibleFlowLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.list = view
            view.backgroundColor = UIColor.clear
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var list: UICollectionView!
    
}
