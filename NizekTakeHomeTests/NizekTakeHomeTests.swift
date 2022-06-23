//
//  NizekTakeHomeTests.swift
//  NizekTakeHomeTests
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import XCTest
@testable import NizekTakeHome

class NizekTakeHomeTests: XCTestCase {

  func test_dismissWelcomeScreen_deallocatesWelcomeScreenViewController() {
    let sut = WelcomeViewController(userViewModel: UserViewModel(user: UserModel()))
//    sut.welcomeView.logoutButton.action = sut.dismissWelcomeScreen
    sut.welcomeView.logoutButton.action = { [weak sut] in sut?.dismissWelcomeScreen() }
    trackForMemoryLeak(sut)
  }
}

extension XCTestCase {
  func trackForMemoryLeak(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
    addTeardownBlock { [weak instance] in
      XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
    }
  }
}
