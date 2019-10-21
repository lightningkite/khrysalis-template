//
// SliderDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class SliderDemoXml {
    
    unowned var slider: UISlider!
    unowned var valueDisplay: UILabel!
    unowned var ratingDisplayNumber: UILabel!
    unowned var ratingDisplayStars: UIRatingBar!
    unowned var ratingDisplayNumberFloat: UILabel!
    unowned var rating: UIRatingBar!
    unowned var ratingFloat: UIRatingBar!
    unowned var ratingDisplayStarsFloat: UIRatingBar!
    unowned var ratingDisplayStarsSmall: UIRatingBar!
    unowned var ratingDisplayStarsSmallFloat: UIRatingBar!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let view = UIScrollView(frame: .zero)
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addVerticalSubview(LinearLayout(frame: .zero)) { view in 
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            view.addSubview(
                UISlider(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.slider = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.valueDisplay = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.rating = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.settings.starSize = 48
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStars = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.settings.starSize = 32
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStarsSmall = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.settings.starSize = 16
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.ratingDisplayNumber = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingFloat = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.settings.starSize = 48
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStarsFloat = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.settings.starSize = 32
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStarsSmallFloat = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.settings.starSize = 16
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.ratingDisplayNumberFloat = view
                view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.numberOfLines = 0
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
        }
        
        xmlRoot = view
        return view
    }
    
}