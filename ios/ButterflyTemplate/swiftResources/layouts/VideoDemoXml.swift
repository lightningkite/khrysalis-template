//
// VideoDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class VideoDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.gravity = .topLeft
        
        view.addSubview(
            UIVideoView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: 200.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.video = view
            applyColor(view, R.color.black) { (c, s) in
                view.backgroundColor = c
            }
        }
        
        view.addSubview(
            UIImageView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: 60.0, height: 30.0),
            margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .centerCenter,
            weight: 0
        ) { view in 
            self.thumbnail = view
            applyColor(view, R.color.black) { (c, s) in
                view.backgroundColor = c
            }
            view.clipsToBounds = true
            view.contentMode = .scaleAspectFit
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
            self.play = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.play_video
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.play_video
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
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
            self.gallery = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.gallery
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.gallery
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
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
            self.camera = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.camera
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.camera
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
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
            self.galleryMulti = view
            view.backgroundDrawable = R.drawable.button_primary
            view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
            view.titleLabel?.textAllCaps = false
            view.titleLabel?.textString = R.string.gallery_multi
            view.titleLabel?.numberOfLines = 0
            view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
            view.textAllCaps = false
            view.textString = R.string.gallery_multi
            view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
            view.contentHorizontalAlignment = .center
            view.contentMode = .scaleAspectFit
            view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
        }
        
        xmlRoot = view
        return view
    }
    
    public var _video: UIVideoView!
    public var video: UIVideoView { get { return _video } set(value){ _video = value } }
    public var _thumbnail: UIImageView!
    public var thumbnail: UIImageView { get { return _thumbnail } set(value){ _thumbnail = value } }
    public var _play: UIButtonWithLayer!
    public var play: UIButtonWithLayer { get { return _play } set(value){ _play = value } }
    public var _gallery: UIButtonWithLayer!
    public var gallery: UIButtonWithLayer { get { return _gallery } set(value){ _gallery = value } }
    public var _camera: UIButtonWithLayer!
    public var camera: UIButtonWithLayer { get { return _camera } set(value){ _camera = value } }
    public var _galleryMulti: UIButtonWithLayer!
    public var galleryMulti: UIButtonWithLayer { get { return _galleryMulti } set(value){ _galleryMulti = value } }
    
}
