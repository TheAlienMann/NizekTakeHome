//
//  LoginViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class LoginViewController: UIViewController {

  let userViewMode: UserViewModel

  lazy var loginView: LoginView = {
    let view = LoginView()
    view.loginButton.action = { [weak self] in self?.goToWelcomeScreen() }
    view.loginButton.isEnabled = true
    view.userNameTextField.delegate = self
    view.passwordTextField.delegate = self
    return view
  }()

  init(userViewModel: UserViewModel) {
    self.userViewMode = userViewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view = loginView
    view.backgroundColor = .white

    setupRemoveFocusFromTextField()
    loginView.loginButton.bindToKeyboard()

  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    userViewMode.userInfo = [:]
  }

  private func goToWelcomeScreen() {
    if Authenticator.userName! == loginView.userNameTextField.text! && Authenticator.password! == loginView.passwordTextField.text! {
      loginView.userNameTextField.resignFirstResponder()
      loginView.passwordTextField.resignFirstResponder()
      let welcomeViewController = WelcomeViewController(userViewModel: userViewMode)
      present(welcomeViewController, animated: true, completion: nil)
    } else {
      print(#line, #file.components(separatedBy: "/").last!, "try again...")
    }
  }

  deinit {
    print(#line, #file.components(separatedBy: "/").last!, "LoginViewController released.")
  }
}

extension LoginViewController: UITextFieldDelegate {
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

extension LoginViewController {
  func setupRemoveFocusFromTextField() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
}
