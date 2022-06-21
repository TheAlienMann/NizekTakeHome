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
  let userViewModel = UserViewModel(user: UserModel())

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let registerViewController = RegisterViewController(userViewModel: userViewModel)
    window?.rootViewController = UINavigationController(rootViewController: registerViewController)
    window?.makeKeyAndVisible()
    return true
  }
}
