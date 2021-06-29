//
//  ResultGameVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 22/04/21.
//

import UIKit

class ResultGameVC: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var saveUserInfoButton: UIButton!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var wrongAnswersLabel: UILabel!
    @IBOutlet weak var finalMessage: UILabel!
    var finalScore = 0
    var numberOfRounds = 10
    var wrongAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wrongAnswers = numberOfRounds - finalScore
        correctAnswersLabel.text = String(finalScore)
        wrongAnswersLabel.text = String(wrongAnswers)
        conditionalMessage()
    }
    
    //MARK: Actions
    @IBAction func saveUserInfo(_ sender: UIButton) {
        if (userNameTextField.text?.count)! > 0 {
            var scores: [Scoreboard] = []
            
            if let data = UserDefaults.standard.data(forKey: "savedScore") {
                if let decodedScores = try? JSONDecoder().decode([Scoreboard].self, from: data) {
                    scores = decodedScores
                }
            }

            let scoreboard = Scoreboard(userName: userNameTextField.text!, userScore: correctAnswersLabel.text!)
            scores.append(scoreboard)

            if let savedScore = try? JSONEncoder().encode(scores) {
                UserDefaults.standard.set(savedScore, forKey: "savedScore")
                UserDefaults.standard.synchronize()
            }
            
        }
        dismissViewControllers()
    }
    
    //MARK: My methods
    func dismissViewControllers() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func conditionalMessage() {
        if finalScore <= wrongAnswers {
            finalMessage.text = "You are not so good! :("
        }
        else if finalScore > wrongAnswers && finalScore != numberOfRounds {
            finalMessage.text = "You are good!"
        }
        else if finalScore == numberOfRounds {
            finalMessage.text = "You are the best! :D"
        }
    }
    
}


