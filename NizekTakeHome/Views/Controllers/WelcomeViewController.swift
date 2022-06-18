//
//  WelcomeViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class WelcomeViewController: UIViewController {

  private var userViewModel: UserViewModel!

  convenience init(userViewModel: UserViewModel) {
    self.init()
    self.userViewModel = userViewModel
  }

  lazy var welcomeView: WelcomeView = {
    let view = WelcomeView()
    view.logoutButton.action = dismissWelcomeScreen
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view = welcomeView
    view.backgroundColor = .white
    welcomeView.greetingMessageLabel.text = "Welcome, \(userViewModel.userInfo["fullName"]!)!"
  }

  private func dismissWelcomeScreen() {
    dismiss(animated: true)
  }
}
