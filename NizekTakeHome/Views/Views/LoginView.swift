//
//  LoginView.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit
import CustomButton

class LoginView: UIView {

  lazy var userNameTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "Enter your username!", leftPaddingWidth: 12, fontSize: 17)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var passwordTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "enter your password, please.", leftPaddingWidth: 12, fontSize: 17)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var loginButton: CustomButton = {
    let button = CustomButton(title: "Login", subtitle: "would you like to login?!", icon: "line.3.crossed.swirl.circle.fill", titleFontSize: 17, subtitleFontSize: 12, imageOptions: .sfSymbol)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(userNameTextField)
    addSubview(passwordTextField)
    addSubview(loginButton)

    setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      userNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      userNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      userNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
      userNameTextField.heightAnchor.constraint(equalToConstant: 44),

      passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 22),
      passwordTextField.heightAnchor.constraint(equalToConstant: 44),

      loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12),
      loginButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
