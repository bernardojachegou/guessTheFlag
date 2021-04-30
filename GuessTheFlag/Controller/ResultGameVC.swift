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
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
  
}


