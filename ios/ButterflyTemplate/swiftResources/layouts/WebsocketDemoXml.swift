//
// WebsocketDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class WebsocketDemoXml {
    
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
            view.textString = "This attaches to a socket that just echos the value back."
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
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
        
        view.addSubview(
            LinearLayout(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 0, height: 0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.orientation = .x
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.gravity = .centerCenter
            
            view.addSubview(
                UITextFieldPadded(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0.0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .centerCenter,
                weight: 1.0
            ) { view in 
                self.input = view
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.backgroundLayer = view.underlineLayer(boldColor: UIColor(argb: 0xFF222222), hintColor: nil)
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                self.submit = view
                view.titleLabel?.font = UIFont.get(size: 12, style: [])
                view.titleLabel?.numberOfLines = 0
                view.contentHorizontalAlignment = .center
                view.iconPosition = .top
                view.iconLayer = R.drawable.ic_send_black_24dp.makeLayer(view)
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
            }
            
        }
        
        xmlRoot = view
        return view
    }
    
    public unowned var items: UICollectionView!
    public unowned var input: UITextFieldPadded!
    public unowned var submit: UIButtonWithLayer!
    
}
