//
//  ResultGameVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 22/04/21.
//

import UIKit

class ResultGameVC: UIViewController {
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var saveUserInfoButton: UIButton!
  @IBOutlet weak var correctAnswersLabel: UILabel!
  @IBOutlet weak var wrongAnswersLabel: UILabel!
  @IBOutlet weak var finalMessage: UILabel!
  
  var finalScore = ""
  var calculateWrongAnswers = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    correctAnswersLabel.text = finalScore
    calculateWrongAnswers = 10 - Int(finalScore)!
    wrongAnswersLabel.text = String(calculateWrongAnswers)
    conditionalMessage()
  }
  
  @IBAction func saveUserInfo(_ sender: UIButton) {
    if (userNameTextField.text?.count)! > 0 {
      let _: Void = UserDefaults.standard.set(correctAnswersLabel.text!, forKey: "userScore")
      let _: Void = UserDefaults.standard.set(userNameTextField.text!, forKey: "userName")
    }
    
    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "start") as UIViewController
    self.present(nextViewController, animated: true, completion: nil)
  }
  
  func conditionalMessage() {
    if Int(finalScore)! <= 4 {
      finalMessage.text = "You are not so good! :("
    }
    else if Int(finalScore)! > 4 && Int(finalScore)! <= 7 {
      finalMessage.text = "You are good!"
    }
    else {
      finalMessage.text = "You are the best! :D"
    }
  }
  
}


