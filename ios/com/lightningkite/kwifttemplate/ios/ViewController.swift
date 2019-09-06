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
    
    static let main = MainViewGenerator()
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
        
        contentView.backgroundColor = ResourcesColors.colorPrimaryDark
        let m = ViewController.main.generate(())
        contentView.addSubview(m)
        mainView = m
        mainView.flex.layout()
        
        addKeyboardObservers()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidLayoutSubviews() {
        mainView.frame.origin.y = UIApplication.shared.statusBarFrame.height
        mainView.frame.size.width = contentView.frame.size.width
        mainView.frame.size.height = contentView.frame.size.height - mainView.frame.origin.y
        mainView.flex.layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardObservers()
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



// MARK: - Extensions to make view controller keyboard-aware.
// Move these to a separate file if you want
extension UIView {
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        
        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        
        return nil
    }
}

extension UIViewController {
    /// How much space (in percentage of remaining available space) to designate under the focused
    /// text field. The higher the number, the close the textfield will be to the keyboard. If you
    /// have a field that won't be covered by the keyboard, keep this number close to 1.
    func spacingPercentageFromTop() -> CGFloat {
        return 0.8
    }
    
    /// Asks the system to resign all first responders (usually input fields), which effectively
    /// causes the keyboard to dismiss itself.
    func resignAllFirstResponders() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        resignAllFirstResponders()
    }
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChangeFrame),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    /// Remove observers that were added previously.
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: self.view.window
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: self.view.window
        )
    }
    
    
    /// Method's notified when the keyboard is about to be shown or change its size.
    ///
    /// - Parameter notification: System keyboard notification
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        if
            let window = view.window,
            let responder = view.firstResponder,
            let userInfo = notification.userInfo,
            let keyboardFrameValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue,
            let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber
        {
            let keyboardHeight = keyboardFrameValue.cgRectValue.height
            UIView.animate(
                withDuration: keyboardAnimationDuration.doubleValue,
                animations: {
                    window.frame.origin.y = min(
                        0,
                        -min(
                            keyboardHeight,
                            responder.layer.position.y
                                - (window.bounds.height - keyboardHeight - responder.bounds.height)
                                * self.spacingPercentageFromTop()
                        )
                    )
                    self.view.layoutIfNeeded()
            }
            )
        }
    }
    
    /// Method's notified when the keyboard is about to be dismissed.
    ///
    /// - Parameter notification: System keyboard notification
    @objc func keyboardWillHide(notification: NSNotification) {
        if
            let window = self.view.window,
            let userInfo = notification.userInfo,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber
        {
            UIView.animate(
                withDuration: animationDuration.doubleValue,
                animations: {
                    window.frame.origin.y = 0
                    self.view.layoutIfNeeded()
            }
            )
        }
    }
}
