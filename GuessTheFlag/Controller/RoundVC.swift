//
//  RoundVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 22/04/21.
//

import UIKit

class RoundVC: UIViewController {
  
  //MARK: Properties
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var flagImageView: UIImageView!
  @IBOutlet weak var firstOptionButton: UIButton!
  @IBOutlet weak var secondOptionButton: UIButton!
  @IBOutlet weak var goFowardButton: UIButton!
  
  var roundList: RoundList? {
    didSet {
      if let roundList = roundList {
        flagImageView.image = UIImage(named: roundList.roundList[0].flagImageName)
        firstOptionButton.setTitle(roundList.roundList[0].flagAnswerOptions[0].flagFirstOption, for: .normal)
        secondOptionButton.setTitle(roundList.roundList[0].flagAnswerOptions[0].flagSecondOption, for: .normal)
      }
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    
    roundList = loadJsonFile(fileName: "database")
    
  }
  
}
