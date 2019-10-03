//
// DrawableDemoXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout

class DrawableDemoXml {
    
    
    
    func setup(_ dependency: ViewDependency) -> UIView {
        return { () -> UIScrollView in 
            let view = UIScrollView(frame: .zero)
            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.flex.direction(.column).alignContent(.center).addItem({
                let sub = { () -> UIView in 
                    let view = UIView(frame: .zero)
                    view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                    view.flex.direction(.column).padding(8, 8, 8, 8).alignContent(.start).justifyContent(.start).define{ (flex) in 
                        flex.addItem({ () -> UILabel in 
                            let view = UILabel(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.text = ResourcesStrings.welcome
                            view.numberOfLines = 0
                            view.font = UIFont.get(size: 24, style: ["bold"])
                            view.textColor = UIColor(argb: 0xFF000000)
                            return view
                        }()
                        ).margin(8, 8, 8, 8).alignSelf(.start)
                        
                        flex.addItem({ () -> UIView in 
                            let view = UIView(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.flex.direction(.row).padding(0, 0, 0, 0).alignContent(.center).justifyContent(.center).define{ (flex) in 
                                flex.addItem({ () -> UIButton in 
                                    let view = UIButton(frame: .zero)
                                    view.backgroundLayer = ResourcesDrawables.buttonAccent(view: view)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.setTitle(ResourcesStrings.ok, for: .normal)
                                    view.contentHorizontalAlignment = .center
                                    view.contentMode = .scaleAspectFit
                                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                                    view.titleLabel?.text = ResourcesStrings.ok
                                    view.titleLabel?.numberOfLines = 0
                                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                                flex.addItem({ () -> UIButton in 
                                    let view = UIButton(frame: .zero)
                                    view.backgroundLayer = ResourcesDrawables.buttonDisabled(view: view)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.setTitle(ResourcesStrings.ok, for: .normal)
                                    view.contentHorizontalAlignment = .center
                                    view.contentMode = .scaleAspectFit
                                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                                    view.titleLabel?.text = ResourcesStrings.ok
                                    view.titleLabel?.numberOfLines = 0
                                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                                flex.addItem({ () -> UIButton in 
                                    let view = UIButton(frame: .zero)
                                    view.backgroundLayer = ResourcesDrawables.buttonPrimary(view: view)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.setTitle(ResourcesStrings.ok, for: .normal)
                                    view.contentHorizontalAlignment = .center
                                    view.contentMode = .scaleAspectFit
                                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                                    view.titleLabel?.text = ResourcesStrings.ok
                                    view.titleLabel?.numberOfLines = 0
                                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                            }
                            return view
                        }()
                        ).margin(0, 0, 0, 0).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UIView in 
                            let view = UIView(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.flex.direction(.row).padding(0, 0, 0, 0).alignContent(.center).justifyContent(.center).define{ (flex) in 
                                flex.addItem({ () -> UIImageView in 
                                    let view = UIImageView(frame: .zero)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.image = UIImage(named: "reason_expertise") ?? ResourcesDrawables.reasonExpertise(view: view).toImage()?.withInset(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                                    view.contentMode = .scaleAspectFit
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                                flex.addItem({ () -> UIButton in 
                                    let view = UIButton(frame: .zero)
                                    view.backgroundLayer = ResourcesDrawables.border(view: view)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.setTitle(ResourcesStrings.ok, for: .normal)
                                    view.contentHorizontalAlignment = .center
                                    view.contentMode = .scaleAspectFit
                                    view.contentEdgeInsets = UIEdgeInsets(top: 0, left:0, bottom:0, right:0)
                                    view.titleLabel?.text = ResourcesStrings.ok
                                    view.titleLabel?.numberOfLines = 0
                                    view.titleLabel?.font = UIFont.get(size: 12, style: [])
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                                flex.addItem({ () -> UIImageView in 
                                    let view = UIImageView(frame: .zero)
                                    view.backgroundColor = ResourcesColors.colorPrimary
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.image = UIImage(named: "ic_arrow_back_white_24dp") ?? ResourcesDrawables.icArrowBackWhite24dp(view: view).toImage()?.withInset(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                                    view.contentMode = .scaleAspectFit
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                            }
                            return view
                        }()
                        ).margin(0, 0, 0, 0).alignSelf(.stretch)
                        
                        flex.addItem({ () -> UIView in 
                            let view = UIView(frame: .zero)
                            view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                            view.flex.direction(.row).padding(0, 0, 0, 0).alignContent(.center).justifyContent(.center).define{ (flex) in 
                                flex.addItem({ () -> UIImageView in 
                                    let view = UIImageView(frame: .zero)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.image = UIImage(named: "ic_android_black_24dp") ?? ResourcesDrawables.icAndroidBlack24dp(view: view).toImage()?.withInset(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                                    view.contentMode = .scaleAspectFit
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                                flex.addItem({ () -> UIImageView in 
                                    let view = UIImageView(frame: .zero)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.image = UIImage(named: "ic_beach_access_black_24dp") ?? ResourcesDrawables.icBeachAccessBlack24dp(view: view).toImage()?.withInset(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                                    view.contentMode = .scaleAspectFit
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                                flex.addItem({ () -> UIImageView in 
                                    let view = UIImageView(frame: .zero)
                                    view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                                    view.image = UIImage(named: "ic_exposure_black_24dp") ?? ResourcesDrawables.icExposureBlack24dp(view: view).toImage()?.withInset(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                                    view.contentMode = .scaleAspectFit
                                    return view
                                }()
                                ).margin(8, 8, 8, 8).grow(1).shrink(1).width(0).height(50).alignSelf(.center)
                                
                            }
                            return view
                        }()
                        ).margin(0, 0, 0, 0).alignSelf(.stretch)
                        
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