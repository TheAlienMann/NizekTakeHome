//
//  LoginViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class LoginViewController: UIViewController {

  private var userViewMode: UserViewModel!

  private var isDisabled: Bool = false {
    didSet {
      isDisabled = loginView.userNameTextField.text!.count >= 2 && loginView.passwordTextField.text!.count >= 2
    }
  }

  lazy var loginView: LoginView = {
    let view = LoginView()
    view.loginButton.action = goToWelcomeScreen
    view.loginButton.isEnabled = true
    view.userNameTextField.delegate = self
    view.passwordTextField.delegate = self
    return view
  }()

  convenience init(userViewModel: UserViewModel) {
    self.init()
    self.userViewMode = userViewModel
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
