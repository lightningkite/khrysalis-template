//
// MapDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class MapDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            MKMapView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.map = view
        }
        
        view.addSubview(
            ScrollViewVertical(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            view.addSubview(LinearLayout(frame: .zero)) { view in 
                view.orientation = .y
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.gravity = .topLeft
                
                view.addSubview(
                    UITextFieldPadded(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    padding: UIEdgeInsets.zero,
                    gravity: .topFill,
                    weight: 0
                ) { view in 
                    self.select = view
                    view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.backgroundLayer = view.underlineLayer(boldColor: UIColor(argb: 0xFF222222), hintColor: nil)
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UICollectionView(frame: .zero, collectionViewLayout: UICollectionView.ReversibleFlowLayout()),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: 100.0),
                    margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    padding: UIEdgeInsets.zero,
                    gravity: .topFill,
                    weight: 0
                ) { view in 
                    self.options = view
                    view.backgroundColor = UIColor.clear
                    view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
                
            }
        }
        
        xmlRoot = view
        return view
    }
    
    public var _map: MKMapView!
    public var map: MKMapView { get { return _map } set(value){ _map = value } }
    public var _select: UITextFieldPadded!
    public var select: UITextFieldPadded { get { return _select } set(value){ _select = value } }
    public var _options: UICollectionView!
    public var options: UICollectionView { get { return _options } set(value){ _options = value } }
    
}
