//
//  RegisterView.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit
import CustomButton

class RegisterView: UIView {

  lazy var fullNameTextField: CustomeTextField = {
    let textFiled = CustomeTextField(placeholderText: "Enter your fullname, please.", leftPaddingWidth: 8, fontSize: 22.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var userNameTextField: CustomeTextField = {
    let textFiled = CustomeTextField(placeholderText: "Enter a username, please.", leftPaddingWidth: 8, fontSize: 22.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var passwordTextField: CustomeTextField = {
    let textFiled = CustomeTextField(placeholderText: "Enter a password, please.", leftPaddingWidth: 8, fontSize: 22.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var registerButton: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: nil, icon: "ss", titleFontSize: 17, subtitleFontSize: nil, imageOptions: .assetImage, action: handleRegister)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private func handleRegister() {
      print(#line, #file.components(separatedBy: "/").last!, "Got tapped...")
  }

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

      userNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      userNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      userNameTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 18),
      userNameTextField.heightAnchor.constraint(equalToConstant: 44.0),

      passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
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
