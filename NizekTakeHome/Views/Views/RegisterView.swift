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

  lazy var fullNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    label.textColor = UIColor.black
    label.font = .systemFont(ofSize: 12.0)
    label.text = "Name should be at least 4 characters."
    return label
  }()

  lazy var userNameTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "Enter a username, please.", leftPaddingWidth: 18, fontSize: 17.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var userNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    label.textColor = UIColor.black
    label.font = .systemFont(ofSize: 12.0)
    label.text = "Username should be at least 2 characters."
    return label
  }()

  lazy var passwordTextField: CustomTextField = {
    let textFiled = CustomTextField(placeholderText: "Enter a password, please.", leftPaddingWidth: 18, fontSize: 17.0)
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var passwordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    label.textColor = UIColor.black
    label.font = .systemFont(ofSize: 12.0)
    label.text = "Password should be at least 2 characters."
    return label
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
    addSubview(fullNameLabel)
    addSubview(userNameLabel)
    addSubview(passwordLabel)
    addSubview(registerButton)

    setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      fullNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      fullNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      fullNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
      fullNameTextField.heightAnchor.constraint(equalToConstant: 44.0),

      fullNameLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 8),
      fullNameLabel.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor, constant: 8),

      userNameTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
      userNameTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
      userNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 18),
      userNameTextField.heightAnchor.constraint(equalToConstant: 44.0),

      userNameLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 8),
      userNameLabel.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor, constant: 8),

      passwordTextField.leadingAnchor.constraint(equalTo: fullNameTextField.leadingAnchor),
      passwordTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
      passwordTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 18),
      passwordTextField.heightAnchor.constraint(equalToConstant: 44.0),

      passwordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
      passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 8),

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
