//
// MarginTestXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class MarginTestXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        self.scrollView = view
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
            view.gravity = .topLeft
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .topLeft
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "left|top"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .bottomLeft
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "left|bottom"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .centerLeft
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "left|cv"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .topCenter
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "ch|top"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .bottomCenter
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "ch|bottom"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .centerCenter
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "ch|cv"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .topRight
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "right|top"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .bottomRight
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "right|bottom"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .centerRight
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "right|cv"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .topFill
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "top"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .bottomFill
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "bottom"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .centerFill
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "cv"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillLeft
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "left"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillRight
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "right"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillCenter
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "ch"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillFill
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "fill"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
            }
            
            view.addSubview(
                LinearLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.orientation = .x
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.gravity = .topLeft
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillLeft,
                    weight: 0
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "a"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillLeft,
                    weight: 0
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "b"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillLeft,
                    weight: 0
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "c"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                    gravity: .fillLeft,
                    weight: 0
                ) { view in 
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "d"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .topLeft
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "left|top"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "left|top"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .bottomLeft
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "left|bottom"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "left|bottom"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerLeft
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "left|cv"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "left|cv"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .topCenter
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "ch|top"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "ch|top"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .bottomCenter
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "ch|bottom"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "ch|bottom"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "ch|cv"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "ch|cv"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .topRight
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "right|top"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "right|top"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .bottomRight
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "right|bottom"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "right|bottom"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerRight
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "right|cv"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "right|cv"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .topFill
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "top"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "top"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .bottomFill
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "bottom"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "bottom"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerFill
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "cv"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "cv"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .fillLeft
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "left"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "left"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .fillRight
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "right"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "right"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .fillCenter
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "ch"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "ch"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
            }
            
            view.addSubview(
                FrameLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: 200.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .fillFill
                ) { view in 
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = "fill"
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = "fill"
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
                }
                
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = "View One"
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = "View Two"
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                gravity: .topRight,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = "View Three"
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = "View Four"
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.scrollToTop = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Scroll to Top"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Scroll to Top"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .centerCenter,
                weight: 0
            ) { view in 
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "View Two"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "View Two"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topRight,
                weight: 0
            ) { view in 
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "View Three"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "View Three"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "View Four"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "View Four"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 16.0, left:16.0, bottom:16.0, right:16.0)
            }
            
            view.addSubview(
                UITextFieldPadded(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.focusTest = view
                view.focusAtStartup = false
                view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                view.backgroundLayer = view.underlineLayer(boldColor: UIColor(argb: 0xFF222222), hintColor: nil)
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 32.0, left: 32.0, bottom: 32.0, right: 32.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = "This is some longer content that is used in an attempt to debug iOS's weirdness involving padding on LinearLayout. Hopefully it works soon."
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 32.0, left: 32.0, bottom: 32.0, right: 32.0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = "This is some longer content that is used in an attempt to debug iOS's weirdness involving padding on LinearLayout. Hopefully it works soon."
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public var _scrollView: ScrollViewVertical!
    public var scrollView: ScrollViewVertical { get { return _scrollView } set(value){ _scrollView = value } }
    public var _scrollToTop: UIButtonWithLayer!
    public var scrollToTop: UIButtonWithLayer { get { return _scrollToTop } set(value){ _scrollToTop = value } }
    public var _focusTest: UITextFieldPadded!
    public var focusTest: UITextFieldPadded { get { return _focusTest } set(value){ _focusTest = value } }
    
}
