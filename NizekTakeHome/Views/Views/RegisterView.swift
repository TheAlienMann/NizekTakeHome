//
//  RegisterView.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit
import CustomButton

class RegisterView: UIView {

  lazy var fullNameTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "Enter your fullname, please.", leftPaddingWidth: 18, fontSize: 17.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    textFiled.autocapitalizationType = .words
    return textFiled
  }()

  lazy var userNameTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "Enter a username, please.", leftPaddingWidth: 18, fontSize: 17.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var passwordTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "Enter a password, please.", leftPaddingWidth: 18, fontSize: 17.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var registerButton: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: nil, icon: "ss", titleFontSize: 17, subtitleFontSize: nil, imageOptions: .assetImage)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(fullNameTextField)
    addSubview(userNameTextField)
    addSubview(passwordTextField)
    addSubview(registerButton)

    setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      fullNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      fullNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      fullNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
      fullNameTextField.heightAnchor.constraint(equalToConstant: 44.0),

      userNameTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
      userNameTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
      userNameTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 18),
      userNameTextField.heightAnchor.constraint(equalToConstant: 44.0),

      passwordTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
      passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 18),
      passwordTextField.heightAnchor.constraint(equalToConstant: 44.0),

      registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12),
      registerButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      registerButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      registerButton.heightAnchor.constraint(equalToConstant: 44),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
