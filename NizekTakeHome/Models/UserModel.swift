//
//  UserModel.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 16.06.22.
//

import Foundation

class UserModel: NSObject {
  @objc dynamic var fullName: String
  @objc dynamic var userName: String
  @objc dynamic var password: String

  init(fullName: String = "",
       userName: String = "",
       password: String = "") {
    self.fullName = fullName
    self.userName = userName
    self.password = password
  }
}
