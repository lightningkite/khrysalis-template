//
// SliderDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class SliderDemoXml {
    
    weak var slider: UISlider!
    weak var valueDisplay: UILabel!
    weak var ratingDisplayNumber: UILabel!
    weak var ratingDisplayStars: UIRatingBar!
    weak var ratingDisplayNumberFloat: UILabel!
    weak var rating: UIRatingBar!
    weak var ratingFloat: UIRatingBar!
    weak var ratingDisplayStarsFloat: UIRatingBar!
    weak var ratingDisplayStarsSmall: UIRatingBar!
    weak var ratingDisplayStarsSmallFloat: UIRatingBar!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIScrollView in 
            let view = UIScrollView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).alignContent(.center).addItem({
                let sub = { () -> UIView in 
                    let view = UIView(frame: .zero)
                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    view.flex.direction(.column).padding(0, 0, 0, 0).alignContent(.start).justifyContent(.start).define{ (flex) in 
                        flex.addItem({ () -> UISlider in 
                            let view = UISlider(frame: .zero)
                            self.slider = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            self.valueDisplay = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 24, style: ["bold"])
                            view.textColor = UIColor(argb: 0xFF000000)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UIRatingBar in 
                            let view = UIRatingBar(frame: .zero)
                            self.rating = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.settings.starSize = 48
                            view.settings.emptyColor = UIColor(argb: 0xFF888888)
                            view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                            view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                            view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.start)
                        
                        flex.addItem({ () -> UIRatingBar in 
                            let view = UIRatingBar(frame: .zero)
                            self.ratingDisplayStars = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.settings.starSize = 32
                            view.settings.updateOnTouch = false
                            view.settings.emptyColor = UIColor(argb: 0xFF888888)
                            view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                            view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                            view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.start)
                        
                        flex.addItem({ () -> UIRatingBar in 
                            let view = UIRatingBar(frame: .zero)
                            self.ratingDisplayStarsSmall = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.settings.starSize = 16
                            view.settings.updateOnTouch = false
                            view.settings.emptyColor = UIColor(argb: 0xFF888888)
                            view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                            view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                            view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.start)
                        
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            self.ratingDisplayNumber = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 24, style: ["bold"])
                            view.textColor = UIColor(argb: 0xFF000000)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UIRatingBar in 
                            let view = UIRatingBar(frame: .zero)
                            self.ratingFloat = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.settings.starSize = 48
                            view.settings.emptyColor = UIColor(argb: 0xFF888888)
                            view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                            view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                            view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.start)
                        
                        flex.addItem({ () -> UIRatingBar in 
                            let view = UIRatingBar(frame: .zero)
                            self.ratingDisplayStarsFloat = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.settings.starSize = 32
                            view.settings.updateOnTouch = false
                            view.settings.emptyColor = UIColor(argb: 0xFF888888)
                            view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                            view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                            view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.start)
                        
                        flex.addItem({ () -> UIRatingBar in 
                            let view = UIRatingBar(frame: .zero)
                            self.ratingDisplayStarsSmallFloat = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.settings.starSize = 16
                            view.settings.updateOnTouch = false
                            view.settings.emptyColor = UIColor(argb: 0xFF888888)
                            view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                            view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                            view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.start)
                        
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            self.ratingDisplayNumberFloat = view
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 24, style: ["bold"])
                            view.textColor = UIColor(argb: 0xFF000000)
                            return view
                        }()
                        ).margin(16, 16, 16, 16).alignSelf(.stretch)
                        
                    }
                    return view
                }()
                
                let dg = ScrollSavingDelegate()
                view.delegate = dg
                view.addOnLayoutSubviews { [weak view, weak sub] in
                    if let view = view, let sub = sub {
                        view.contentSize = sub.frame.size
                        view.contentOffset = dg.lastNonzeroOffset
                    }
                }
                
                return sub
            }()
            ).shrink(0)
            return view
        }()
        
    }
}