//
//  UIButton.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 20/04/21.
//

import UIKit

class DefaultButton: UIButton {
  
  func buttonSettings() {
    let primaryColor = UIColor.init(red: 42/255, green: 42/255, blue: 87/255, alpha: 1)
    let secondaryColor = UIColor.init(red: 255/255, green: 216/255, blue: 0, alpha: 255)
    let shadowColor = UIColor.init(red: 11/255, green: 9/255, blue: 4/255, alpha: 1)
    
    self.backgroundColor = primaryColor
    self.layer.cornerRadius = 20.0
    self.tintColor = secondaryColor
    self.titleLabel!.layer.shadowColor = shadowColor.cgColor
    self.titleLabel!.layer.shadowOffset = CGSize(width: 3.0, height: 1.0)
    self.titleLabel!.layer.shadowOpacity = 1.0
    self.titleLabel!.layer.shadowRadius = 0
    self.titleLabel!.layer.masksToBounds = false
  }
  
  override init(frame: CGRect) {
    super.init(frame:frame)
    buttonSettings()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    buttonSettings()
  }
  
}
