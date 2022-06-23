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
  let userViewModel = UserViewModel(user: UserModel(), isAuthenticated: false)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let registerViewController = RegisterViewController(userViewModel: userViewModel)
    window?.rootViewController = UINavigationController(rootViewController: registerViewController)
    window?.makeKeyAndVisible()
    return true
  }

  var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)

  func applicationDidEnterBackground(_ application: UIApplication) {
    backgroundTask = UIApplication.shared.beginBackgroundTask(expirationHandler: { [weak self] in

      UIApplication.shared.endBackgroundTask(self!.backgroundTask)
    })
    if let isAuthenticated = userViewModel.isAuthenticated, isAuthenticated {
      userViewModel.startTimer()
    }
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    UIApplication.shared.endBackgroundTask(backgroundTask)
    userViewModel.isAuthenticated = false
    print(#line, #file.components(separatedBy: "/").last!, "finished backgroundTask")
  }
}
