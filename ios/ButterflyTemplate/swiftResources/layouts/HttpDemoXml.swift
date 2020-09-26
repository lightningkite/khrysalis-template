//
// HttpDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class HttpDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        view.gravity = .topLeft
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.font = UIFont.get(size: 16.0, style: [])
            view.textString = R.string.this_data_is_loaded_from_json_placeholder_typicode
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UIProgressView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.progress = view
            view.progressViewStyle = .bar
            view.progressTintColor = R.color.colorPrimary
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
            self.items = view
            view.backgroundColor = UIColor.clear
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var progress: UIProgressView!
    public unowned var items: UICollectionView!
    
}
