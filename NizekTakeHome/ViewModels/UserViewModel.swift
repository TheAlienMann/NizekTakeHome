//
//  UserViewModel.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 16.06.22.
//

import Foundation


class UserViewModel: NSObject {

  @objc dynamic var user: UserModel
  @objc dynamic var userInfo: String = ""

  private var userObserver: NSKeyValueObservation?

  init(user: UserModel) {
    self.user = user
    super.init()
  }

  func bindUser() {

    userObserver = observe(\.user, options: [.initial, .new], changeHandler: { [weak self] object, change in
      if let newUser = change.newValue {
        self?.userInfo = "\(newUser.fullName) \(newUser.userName) \(newUser.password)"
      }
    })
  }
}
