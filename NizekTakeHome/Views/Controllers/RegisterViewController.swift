//
//  RegisterViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class RegisterViewController: UIViewController {

  let userViewModel: UserViewModel

  lazy var registerView: RegisterView = {
    let view = RegisterView()
    view.registerButton.action = { [weak self] in self?.didTapRegisterButton() }
    view.registerButton.isEnabled = userViewModel.isRegisterButtonEnabled
    view.fullNameTextField.addTarget(self, action: #selector(fullNameDidChange), for: .editingChanged)
    view.userNameTextField.addTarget(self, action: #selector(usernameDidChange), for: .editingChanged)
    view.passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
    view.fullNameTextField.delegate = self
    view.userNameTextField.delegate = self
    view.passwordTextField.delegate = self
    return view
  }()

  init(userViewModel: UserViewModel) {
    self.userViewModel = userViewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view = registerView
    view.backgroundColor = .white

    setupRemoveFocusFromTextField()
    registerView.registerButton.bindToKeyboard()
  }

  func didTapRegisterButton() {
    print(#line, #file.components(separatedBy: "/").last!, userViewModel.userInfo)
    Authenticator.userName = userViewModel.userInfo["userName"]
    Authenticator.password = userViewModel.userInfo["password"]
    registerView.fullNameTextField.resignFirstResponder()
    registerView.userNameTextField.resignFirstResponder()
    registerView.passwordTextField.resignFirstResponder()
    let loginViewController = LoginViewController(userViewModel: userViewModel)
    navigationController?.pushViewController(loginViewController, animated: true)
  }

  @objc private func fullNameDidChange() {
    userViewModel.user.fullName = registerView.fullNameTextField.text!
    registerView.registerButton.isEnabled = userViewModel.isRegisterButtonEnabled
    registerView.fullNameLabel.textColor = userViewModel.isFullnameAcceptable ? UIColor.systemGreen : UIColor.systemRed
  }

  @objc private func usernameDidChange() {
    userViewModel.user.userName = registerView.userNameTextField.text!
    registerView.registerButton.isEnabled = userViewModel.isRegisterButtonEnabled
    registerView.userNameLabel.textColor = userViewModel.isUsernameAcceptable ? UIColor.systemGreen : UIColor.systemRed
  }

  @objc private func passwordDidChange() {
    userViewModel.user.password = registerView.passwordTextField.text!
    registerView.registerButton.isEnabled = userViewModel.isRegisterButtonEnabled
    registerView.passwordLabel.textColor = userViewModel.isPasswordAcceptable ? UIColor.systemGreen : UIColor.systemRed
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
