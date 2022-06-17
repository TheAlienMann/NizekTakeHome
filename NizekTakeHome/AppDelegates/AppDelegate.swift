//
//  AppDelegate.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let userViewModel = UserViewModel(user: UserModel())
    let registerViewController = RegisterViewController(userViewModel: userViewModel)
    window?.rootViewController = registerViewController
    guard let root = window?.rootViewController as? RegisterViewController else {
      return true
    }
    window?.rootViewController = UINavigationController(rootViewController: root)
    window?.makeKeyAndVisible()
    return true
  }
}
