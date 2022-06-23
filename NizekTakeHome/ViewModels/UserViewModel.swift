//
//  UserViewModel.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 16.06.22.
//

import Foundation
import UIKit

protocol UserInterface {
  var user: UserModel { get set }
}

class UserViewModel: NSObject {

  var isAuthenticated: Bool?
  private var timer = Timer()

  @objc dynamic let user: UserModel
  @objc dynamic var userInfo: [String: String] = [:]

  @objc dynamic var isRegisterButtonEnabled: Bool = false
  @objc dynamic var isFullnameAcceptable: Bool = false
  @objc dynamic var isUsernameAcceptable: Bool = false
  @objc dynamic var isPasswordAcceptable: Bool = false

  private var userInfoObserver: NSKeyValueObservation?
  private var fullnameObserver: NSKeyValueObservation?
  private var usernameObserver: NSKeyValueObservation?
  private var passwordObserver: NSKeyValueObservation?

  init(user: UserModel, isAuthenticated: Bool? = nil) {
    self.user = user
    self.isAuthenticated = isAuthenticated
    super.init()

    fullnameObserver = observe(\.user.fullName, options: [.initial, .new], changeHandler: { [weak self] object, change in
      if let newFullname = change.newValue {
        if newFullname.count >= 4 {
          self?.userInfo["fullName"] = newFullname
          self?.isFullnameAcceptable = true
        } else {
          self?.userInfo.removeValue(forKey: "fullName")
          self?.isFullnameAcceptable = false
        }
      }
    })

    usernameObserver = observe(\.user.userName, options: [.initial, .new], changeHandler: { [weak self] object, change in
      if let newUsername = change.newValue {
        if newUsername.count >= 2 {
          self?.userInfo["userName"] = newUsername
          self?.isUsernameAcceptable = true
        } else {
          self?.userInfo.removeValue(forKey: "userName")
          self?.isUsernameAcceptable = false
        }
      }
    })

    passwordObserver = observe(\.user.password, options: [.initial, .new], changeHandler: { [weak self] object, change in
      if let newPassword = change.newValue {
        if newPassword.count >= 2 {
          self?.userInfo["password"] = newPassword
          self?.isPasswordAcceptable = true
        } else {
          self?.userInfo.removeValue(forKey: "password")
          self?.isPasswordAcceptable = false
        }
      }
    })


    userInfoObserver = observe(\.userInfo, options: [.initial, .new], changeHandler: { [weak self] object, change in
      if let newUserInfo = change.newValue, newUserInfo.count == 3 {
        self?.isRegisterButtonEnabled = true
      } else {
        self?.isRegisterButtonEnabled = false
      }
    })
  }

  func startTimer() {
    print(#line, #file.components(separatedBy: "/").last!, "Timer started.")
      timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { [weak self] _ in
        self?.isAuthenticated = false
        self?.stopTimer()
        NotificationCenter.default.post(name: NSNotification.Name("StopTimerInWelcomeViewController"), object: nil)
        NotificationCenter.default.post(Notification.init(name: Notification.Name.init(rawValue: "dismiss"), object: nil, userInfo: nil))
        print(#line, #file.components(separatedBy: "/").last!, "Timer stopped.")
      })
  }

  func stopTimer() {
    timer.invalidate()
  }
}
