//
//  WelcomeViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class WelcomeViewController: UIViewController {

  lazy var welcomeView: WelcomeView = {
    let view = WelcomeView()
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view = welcomeView
    view.backgroundColor = .white
  }
}
