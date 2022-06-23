//
//  Authenticator.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 18.06.22.
//

import Foundation

class Authenticator {
  static var userName: String? {
    get { UserDefaults.standard.string(forKey: "userName") }
    set { UserDefaults.standard.set(newValue, forKey: "userName") }
  }
  static var password: String? {
    get { UserDefaults.standard.string(forKey: "password") }
    set { UserDefaults.standard.set(newValue, forKey: "password") }
  }
}
