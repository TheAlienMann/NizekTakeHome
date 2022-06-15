//
//  RegisterViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class RegisterViewController: UIViewController {

  lazy var registerView: RegisterView = {
    let view = RegisterView()
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view = registerView
    view.backgroundColor = .white
  }
}
