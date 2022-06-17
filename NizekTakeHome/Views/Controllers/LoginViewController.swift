//
//  LoginViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class LoginViewController: UIViewController {

  lazy var loginView: LoginView = {
    let view = LoginView()
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view = loginView
    view.backgroundColor = .white
  }
}
