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

    if let isAuthenticated = userViewModel.isAuthenticated, isAuthenticated {
      timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false, block: { [weak self] _ in
        self?.userViewModel.isAuthenticated = false
        self?.dismissWelcomeScreen()
      })
    }

    NotificationCenter.default.addObserver(forName: NSNotification.Name("StopTimerInWelcomeViewController"), object: nil, queue: nil) { [weak self] _ in self?.timer.invalidate() }
    NotificationCenter.default.addObserver(forName: NSNotification.Name.init(rawValue: "dismiss"), object: nil, queue: nil) { [weak self] _ in
      self?.dismissWelcomeScreen()
    }
  }

  func dismissWelcomeScreen() {
    dismiss(animated: true)
  }

  deinit {
    timer.invalidate()
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name("dismiss"), object: nil)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name("StopTimerInWelcomeViewController"), object: nil)
    print(#line, #file.components(separatedBy: "/").last!, "WelcomeViewController released.")
  }
}
