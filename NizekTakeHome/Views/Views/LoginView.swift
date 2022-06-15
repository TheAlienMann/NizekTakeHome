//
//  LoginView.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class LoginView: UIView {

  lazy var userNameTextField: UITextField = {
    let textFiled = UITextField()
    return textFiled
  }()

  lazy var passwordTextField: UITextField = {
    let textFiled = UITextField()
    textFiled.translatesAutoresizingMaskIntoConstraints = false
    return textFiled
  }()

  lazy var loginButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
