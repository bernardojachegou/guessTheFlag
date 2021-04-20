//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 19/04/21.
//

import UIKit

class ViewController: UIViewController {
  
  //MARK: Properties
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var scoreboardButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let backgroundColor = UIColor.init(red: 60/255, green: 60/255, blue: 76/255, alpha: 1)
    view.backgroundColor = backgroundColor
    
  }
  
}

