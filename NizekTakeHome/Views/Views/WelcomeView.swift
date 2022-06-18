//
//  WelcomeView.swift
//  NizekTakeHome
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit
import CustomButton

class WelcomeView: UIView {

  lazy var greetingMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 28)
    label.textAlignment = .center
    label.textColor = .systemRed
    return label
  }()

  lazy var logoutButton: CustomButton = {
    let button = CustomButton(title: "LogOut", subtitle: "would you like to get out of here?!", icon: "arrowshape.bounce.forward", titleFontSize: 17, subtitleFontSize: 12, imageOptions: .sfSymbol)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(greetingMessageLabel)
    addSubview(logoutButton)

    setupConstraints()
  }

  private func handleLogout() {
    print(#line, #file.components(separatedBy: "/").last!, "logged out....")
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      greetingMessageLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -155),
      greetingMessageLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      greetingMessageLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      greetingMessageLabel.heightAnchor.constraint(equalToConstant: 44),

      logoutButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
      logoutButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
      logoutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12),
      logoutButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
