//
//  KeyboardLayoutHandler.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 17.06.22.
//

import UIKit

extension UIView {
  func bindToKeyboard() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
  }

  @objc func keyboardWillChange(_ notification: NSNotification) {
    let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let begginingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let deltaY = endFrame.origin.y - begginingFrame.origin.y

    UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
      self.frame.origin.y += deltaY
    }, completion: nil)
  }
}
