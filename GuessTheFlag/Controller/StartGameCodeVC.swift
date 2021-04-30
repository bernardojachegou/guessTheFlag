//
//  StartGameCodeVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 30/04/21.
//

import UIKit

class StartGameCodeVC: UIViewController {
  
  let logoImageView = UIImageView()
  let startButton = UIButton()
  let scoreButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let logoImage = UIImage(named: "logo.png")
    logoImageView.image = logoImage
    
    self.view.backgroundColor = UIColor.init(red: 60/255, green: 60/255, blue: 76/255, alpha: 1.0)
    self.view.addSubview(logoImageView)
    self.view.addSubview(startButton)
    self.view.addSubview(scoreButton)
    
    // logoImageView settings:
    // Frame
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.frame = CGRect(x: 0, y: 0, width: logoImage?.size.width ?? 250, height: logoImage?.size.height ?? 250)
    
    // Constraints
    logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0).isActive = true
    logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
    
    // startButton settings:
    // Frame
    startButton.translatesAutoresizingMaskIntoConstraints = false
    startButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 40.0, height: 40.0)
    startButton.backgroundColor = UIColor.init(red: 42/255, green: 42/255, blue: 87/255, alpha: 1.0)
    startButton.layer.cornerRadius = 15.0
    // Label
    startButton.setTitle("Play", for: .normal)
    startButton.setTitleColor(UIColor.init(red: 244/255, green: 211/255, blue: 4/255, alpha: 1.0), for: .normal)
    startButton.titleLabel?.font = UIFont(name: "Roboto-bold", size: 32.0)
    // Shadow
    startButton.titleLabel?.layer.shadowColor = UIColor.black.cgColor
    startButton.titleLabel?.layer.shadowOffset = CGSize(width: 2.0, height: 1.0)
    startButton.titleLabel?.layer.shadowOpacity = 1.0
    
    // Constraints
    startButton.bottomAnchor.constraint(equalTo: scoreButton.topAnchor, constant: -20.0).isActive = true
    startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
    startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
    
    // Action
    startButton.addTarget(self, action: #selector(StartGameCodeVC.sendToRoundView(sender:)), for: .touchUpInside)
    
    // scoreButton settings:
    // Frame
    scoreButton.translatesAutoresizingMaskIntoConstraints = false
    scoreButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 40.0, height: 40.0)
    scoreButton.backgroundColor = UIColor.init(red: 42/255, green: 42/255, blue: 87/255, alpha: 1.0)
    scoreButton.layer.cornerRadius = 15.0
    // Label
    scoreButton.setTitle("Scoreboard", for: .normal)
    scoreButton.setTitleColor(UIColor.init(red: 244/255, green: 211/255, blue: 4/255, alpha: 1.0), for: .normal)
    scoreButton.titleLabel?.font = UIFont(name: "Roboto-bold", size: 32.0)
    // Shadow
    scoreButton.titleLabel?.layer.shadowColor = UIColor.black.cgColor
    scoreButton.titleLabel?.layer.shadowOffset = CGSize(width: 2.0, height: 1.0)
    scoreButton.titleLabel?.layer.shadowOpacity = 1.0
    
    // Constraints
    scoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
    scoreButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
    scoreButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
    
    // Action
    scoreButton.addTarget(self, action: #selector(StartGameCodeVC.sendToScoreboardView(sender:)), for: .touchUpInside)
    
  }
  
  @objc func sendToRoundView(sender: UIButton) {
    sender.pulsate()
    print("\(String(describing: sender.titleLabel?.text)) was pressed!")
  }
  
  @objc func sendToScoreboardView(sender: UIButton) {
    sender.pulsate()
    print("\(String(describing: sender.titleLabel?.text)) was pressed!")
  }
}

extension UIButton {
  func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.2
    pulse.fromValue = 0.90
    pulse.toValue = 1.0
    pulse.autoreverses = true
    //    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.8
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
  }
  
  func flash() {
    let flash = CABasicAnimation(keyPath: "opacity")
    flash.duration = 0.1
    flash.fromValue = 1
    flash.toValue = 0.1
    flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    flash.autoreverses = true
    flash.repeatCount = 2
    layer.add(flash, forKey: nil)
  }
}
