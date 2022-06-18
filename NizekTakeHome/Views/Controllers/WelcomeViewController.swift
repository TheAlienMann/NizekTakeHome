//
//  WelcomeViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class WelcomeViewController: UIViewController {

  private var userViewModel: UserViewModel!
  lazy var welcomeView: WelcomeView = {
    let view = WelcomeView()
    view.logoutButton.action = dismissWelcomeScreen
    return view
  }()

  var timer = Timer()

  convenience init(userViewModel: UserViewModel) {
    self.init()
    self.userViewModel = userViewModel
  }


  override func viewDidLoad() {
    super.viewDidLoad()

    view = welcomeView
    view.backgroundColor = .white
    welcomeView.greetingMessageLabel.text = "Welcome, \(userViewModel.userInfo["fullName"]!)!"

    timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { [weak self] _ in
      self?.dismissWelcomeScreen()
    })
  }

  private func dismissWelcomeScreen() {
    dismiss(animated: true)
    timer.invalidate()
  }

  deinit {
    timer.invalidate()
  }
}
