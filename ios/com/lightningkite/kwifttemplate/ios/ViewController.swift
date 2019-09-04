//
//  ViewController.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 2/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import UIKit
import FlexLayout

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    static let main = MainVG()
    @IBOutlet var bottomConstraintForKeyboard: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    
    weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.imageRequestEvent.addWeak(self) { (this, _) in
            this.pickImage()
        }
        
        showDialogEvent.addWeak(self){ (this, request) in
            let message = request.string ?? request.stringReference ?? ""
            let alert = UIAlertController(title: ResourcesStrings.appName, message: message, preferredStyle: .alert)
            if let confirmation = request.confirmation {
                alert.addAction(UIAlertAction(title: ResourcesStrings.ok, style: .default, handler: { (action) in
                    confirmation()
                }))
                alert.addAction(UIAlertAction(title: ResourcesStrings.cancel, style: .default, handler: { (action) in
                    
                }))
            } else {
                alert.addAction(UIAlertAction(title: ResourcesStrings.ok, style: .default, handler: { (action) in
                    
                }))
            }
            this.present(alert, animated: true, completion: {})
        }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
        contentView.backgroundColor = ResourcesColors.colorPrimaryDark
        let m = ViewController.main.generate(())
        contentView.addSubview(m)
        mainView = m
        mainView.flex.layout()
    }
    
    override func viewDidLayoutSubviews() {
        mainView.frame.origin.y = UIApplication.shared.statusBarFrame.height
        mainView.frame.size.width = contentView.frame.size.width
        mainView.frame.size.height = contentView.frame.size.height - mainView.frame.origin.y
        mainView.flex.layout()
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        print("SHOW KEYBOARD")
        let i = sender.userInfo!
        let k = (i[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomConstraintForKeyboard.constant = k - bottomLayoutGuide.length
        let s: TimeInterval = (i[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: s) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        print("HIDE KEYBOARD")
        let i = sender.userInfo!
        let k = (i[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomConstraintForKeyboard.constant = 0
        let s: TimeInterval = (i[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: s) { self.view.layoutIfNeeded() }
    }
    
    static var imageRequestEvent: StandardEvent<Void> = StandardEvent()
    static var imageRequestResultEvent: StandardEvent<UIImage> = StandardEvent()

    var imagePicker = UIImagePickerController()
    func pickImage() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        picker.dismiss(animated: true, completion: {
            ViewController.imageRequestResultEvent.invokeAll(image)
        })
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        imagePickerController(picker: picker, didFinishPickingImage: image, editingInfo: nil)
    }
}

