//
// DrawableDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class DrawableDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textString = R.string.welcome
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
                view.gravity = .centerCenter
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.backgroundLayer = R.drawable.button_accent(view)
                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                    view.titleLabel?.textString = R.string.ok
                    view.titleLabel?.numberOfLines = 0
                    view.textString = R.string.ok
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.backgroundLayer = R.drawable.button_disabled(view)
                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                    view.titleLabel?.textString = R.string.ok
                    view.titleLabel?.numberOfLines = 0
                    view.textString = R.string.ok
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.backgroundLayer = R.drawable.button_primary(view)
                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                    view.titleLabel?.textString = R.string.ok
                    view.titleLabel?.numberOfLines = 0
                    view.textString = R.string.ok
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                }
                
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
                    UIImageView(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.image = UIImage(named: "reason_expertise") ?? R.drawable.reason_expertise(view).toImage()
                    view.clipsToBounds = true
                    view.contentMode = .scaleAspectFit
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.backgroundLayer = R.drawable.border(view)
                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                    view.titleLabel?.textString = R.string.ok
                    view.titleLabel?.numberOfLines = 0
                    view.textString = R.string.ok
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                }
                
                view.addSubview(
                    UIImageView(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    applyColor(view, R.color.colorPrimary) { c in
                        view.backgroundColor = c
                    }
                    view.image = UIImage(named: "ic_arrow_back_white_24dp") ?? R.drawable.ic_arrow_back_white_24dp(view).toImage()
                    view.clipsToBounds = true
                    view.contentMode = .scaleAspectFit
                }
                
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
                    UIImageView(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.image = UIImage(named: "ic_android_black_24dp") ?? R.drawable.ic_android_black_24dp(view).toImage()
                    view.clipsToBounds = true
                    view.contentMode = .scaleAspectFit
                }
                
                view.addSubview(
                    UIImageView(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.image = UIImage(named: "ic_beach_access_black_24dp") ?? R.drawable.ic_beach_access_black_24dp(view).toImage()
                    view.clipsToBounds = true
                    view.contentMode = .scaleAspectFit
                }
                
                view.addSubview(
                    UIImageView(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0, height: 50),
                    margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    view.image = UIImage(named: "ic_exposure_black_24dp") ?? R.drawable.ic_exposure_black_24dp(view).toImage()
                    view.clipsToBounds = true
                    view.contentMode = .scaleAspectFit
                }
                
            }
            
        }
        xmlRoot = view
        return view
    }
    
    
}
