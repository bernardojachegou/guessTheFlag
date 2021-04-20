//
//  UIButton.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 20/04/21.
//

import UIKit

class DefaultButtonFormat: UIButton {
  
  static func defaultButtonFormat() -> UIButton {
    let button = UIButton()
    let primaryColor = UIColor.init(red: 42/255, green: 42/255, blue: 87/255, alpha: 1)
    let secondaryColor = UIColor.init(red: 255/255, green: 216/255, blue: 0, alpha: 255)
    let shadowColor = UIColor.init(red: 11/255, green: 9/255, blue: 4/255, alpha: 1)
    
    button.backgroundColor = primaryColor
    button.layer.cornerRadius = 20.0
    button.tintColor = secondaryColor
    button.titleLabel!.layer.shadowColor = shadowColor.cgColor
    button.titleLabel!.layer.shadowOffset = CGSize(width: 3.0, height: 1.0)
    button.titleLabel!.layer.shadowOpacity = 1.0
    button.titleLabel!.layer.shadowRadius = 0
    button.titleLabel!.layer.masksToBounds = false
    return button
  }
  
  
}
