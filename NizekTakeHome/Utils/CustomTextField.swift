//
//  CustomTextField.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class CustomTextField: UITextField {
  var placeholderText: String {
    didSet {
      setPlaceholder()
    }
  }
  var leftPaddingWidth: Int {
    didSet {
       setLeftPaddingWidth()
    }
  }
  var fontSize: CGFloat {
    didSet {
      setFontSize()
    }
  }

  init(placeholderText: String, leftPaddingWidth: Int, fontSize: CGFloat) {
    self.placeholderText = placeholderText
    self.leftPaddingWidth = leftPaddingWidth
    self.fontSize = fontSize
    super.init(frame: .zero)

    autocorrectionType = .no
    autocapitalizationType = .none
    spellCheckingType = .no
    
    setPlaceholder()
    setLeftPaddingWidth()
    setFontSize()
  }

  private func setPlaceholder() {
    attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.6), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)])
  }

  private func setLeftPaddingWidth() {
    leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: leftPaddingWidth, height: 0)))
    leftViewMode = .always
  }

  private func setFontSize() {
    font = UIFont.systemFont(ofSize: fontSize)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    layer.borderColor = UIColor.gray.cgColor
    layer.borderWidth = 0.4
    layer.cornerRadius = bounds.height * 0.2
  }
}
