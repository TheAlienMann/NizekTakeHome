//
//  RegisterViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class RegisterViewController: UIViewController {

  private var userViewModel: UserViewModel!

  lazy var registerView: RegisterView = {
    let view = RegisterView()
    view.registerButton.action = didTapRegisterButton
    view.fullNameTextField.addTarget(self, action: #selector(fullNameDidChange), for: .editingChanged)
    view.userNameTextField.addTarget(self, action: #selector(usernameDidChange), for: .editingChanged)
    view.passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
    view.fullNameTextField.delegate = self
    view.userNameTextField.delegate = self
    view.passwordTextField.delegate = self
    return view
  }()


  convenience init(userViewModel: UserViewModel) {
    self.init()
    self.userViewModel = userViewModel
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view = registerView
    view.backgroundColor = .white

    setupRemoveFocusFromTextField()
    registerView.registerButton.bindToKeyboard()
  }

  func didTapRegisterButton() {
    userViewModel.bindUser()
    print(#line, #file.components(separatedBy: "/").last!, userViewModel.userInfo)
    registerView.fullNameTextField.resignFirstResponder()
    registerView.userNameTextField.resignFirstResponder()
    registerView.passwordTextField.resignFirstResponder()
  }

  @objc private func fullNameDidChange() {
    userViewModel.user.fullName = registerView.fullNameTextField.text!
  }

  @objc private func usernameDidChange() {
    userViewModel.user.userName = registerView.userNameTextField.text!
  }

  @objc private func passwordDidChange() {
    userViewModel.user.password = registerView.passwordTextField.text!
  }
}

extension RegisterViewController: UITextFieldDelegate {
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  override func resignFirstResponder() -> Bool {
    return true
  }
}

extension RegisterViewController {
  func setupRemoveFocusFromTextField() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
}
