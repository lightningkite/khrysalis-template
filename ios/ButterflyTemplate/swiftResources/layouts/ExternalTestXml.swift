//
// ExternalTestXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class ExternalTestXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        self.scrollView = view
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
            view.gravity = .topLeft
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.openMap = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Show me Lightning Kite's Location"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Show me Lightning Kite's Location"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.openWeb = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Show me Lightning Kite's Website"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Show me Lightning Kite's Website"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.openEvent = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Show me a future event"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Show me a future event"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickImage = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick an image"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick an image"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickImages = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick images"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick images"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickVideo = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick a video"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick a video"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickVideos = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick videos"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick videos"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickMedia = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick a media"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick a media"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickMedias = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick medias"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick medias"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickFile = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick a file"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick a file"
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.pickFiles = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Pick files"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Pick files"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public var _scrollView: ScrollViewVertical!
    public var scrollView: ScrollViewVertical { get { return _scrollView } set(value){ _scrollView = value } }
    public var _openMap: UIButtonWithLayer!
    public var openMap: UIButtonWithLayer { get { return _openMap } set(value){ _openMap = value } }
    public var _openWeb: UIButtonWithLayer!
    public var openWeb: UIButtonWithLayer { get { return _openWeb } set(value){ _openWeb = value } }
    public var _openEvent: UIButtonWithLayer!
    public var openEvent: UIButtonWithLayer { get { return _openEvent } set(value){ _openEvent = value } }
    public var _pickImage: UIButtonWithLayer!
    public var pickImage: UIButtonWithLayer { get { return _pickImage } set(value){ _pickImage = value } }
    public var _pickImages: UIButtonWithLayer!
    public var pickImages: UIButtonWithLayer { get { return _pickImages } set(value){ _pickImages = value } }
    public var _pickVideo: UIButtonWithLayer!
    public var pickVideo: UIButtonWithLayer { get { return _pickVideo } set(value){ _pickVideo = value } }
    public var _pickVideos: UIButtonWithLayer!
    public var pickVideos: UIButtonWithLayer { get { return _pickVideos } set(value){ _pickVideos = value } }
    public var _pickMedia: UIButtonWithLayer!
    public var pickMedia: UIButtonWithLayer { get { return _pickMedia } set(value){ _pickMedia = value } }
    public var _pickMedias: UIButtonWithLayer!
    public var pickMedias: UIButtonWithLayer { get { return _pickMedias } set(value){ _pickMedias = value } }
    public var _pickFile: UIButtonWithLayer!
    public var pickFile: UIButtonWithLayer { get { return _pickFile } set(value){ _pickFile = value } }
    public var _pickFiles: UIButtonWithLayer!
    public var pickFiles: UIButtonWithLayer { get { return _pickFiles } set(value){ _pickFiles = value } }
    
}
