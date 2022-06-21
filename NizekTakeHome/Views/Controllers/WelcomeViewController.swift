//
//  WelcomeViewController.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

class WelcomeViewController: UIViewController {

  let userViewModel: UserViewModel
  lazy var welcomeView: WelcomeView = {
    let view = WelcomeView()
    view.logoutButton.action = { [weak self] in self?.dismissWelcomeScreen() }
    return view
  }()

  var timer = Timer()

  init(userViewModel: UserViewModel) {
    self.userViewModel = userViewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
  }

  deinit {
    timer.invalidate()
    print(#line, #file.components(separatedBy: "/").last!, "WelcomeViewController released.")
  }
}
