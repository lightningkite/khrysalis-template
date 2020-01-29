//
// BleScanDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class BleScanDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textString = "Scan time!"
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
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
                view.gravity = .topLeft
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .topLeft,
                    weight: 0
                ) { view in 
                    self.button = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "Start Scan"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "Start Scan"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 0),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .topLeft,
                    weight: 0
                ) { view in 
                    self.host = view
                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                    view.titleLabel?.font = UIFont.get(size: 16, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "Become Host"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "Become Host"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
                }
                
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.status = view
                view.font = UIFont.get(size: 16, style: [])
                view.textString = "Status"
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UITableView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.items = view
                view.separatorStyle = .none
                view.separatorStyle = .none
                view.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var button: UIButtonWithLayer!
    public unowned var host: UIButtonWithLayer!
    public unowned var items: UITableView!
    public unowned var status: UILabel!
    
}
