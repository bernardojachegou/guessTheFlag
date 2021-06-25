//
//  RoundVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 22/04/21.
//

import UIKit

class RoundVC: UIViewController {
    
    class CustomTags {
        static let firstOptionButtonTag = 80
        static let secondOptionButtonTag = 81
        static var flagCorrectOption = 0
    }
    
    //MARK: Properties
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var goFowardButton: UIButton!
    var selectedIndex = 0
    var roundsLeft = 10
    
    var roundList: RoundList? {
        didSet {
            updateViewForNewRound()
        }
    }
    
    var scoreValue: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(scoreValue)"
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        roundList = loadJsonFile(fileName: "database")
        prepareButtons()
        scoreValue = 0
    }
    
    //MARK: My methods
    func prepareButtons() {
        goFowardButton.isUserInteractionEnabled = false
        goFowardButton.alpha = 0.5
        firstOptionButton.tag = CustomTags.firstOptionButtonTag
        secondOptionButton.tag = CustomTags.secondOptionButtonTag
    }
    
    func checkAnswer(button: Int) {
        if button == CustomTags.flagCorrectOption {
            scoreValue += 1
            if let correctButton = view.viewWithTag(button) {
                correctButton.backgroundColor = UIColor.primaryColor
            }
        }
        else {
            if let wrongButton = view.viewWithTag(button) {
                wrongButton.backgroundColor = UIColor.secondaryColor
            }
        }
        
        if roundsLeft == 1 {
            goFowardButton.setTitle("Finish", for: .normal)
        }
        
        firstOptionButton.isUserInteractionEnabled = false
        secondOptionButton.isUserInteractionEnabled = false
        goFowardButton.isUserInteractionEnabled = true
        goFowardButton.alpha = 1.0
    }
    
    func updateViewForNewRound() {
        if let round = roundList {
            let randomIndex = Int.random(in: 0..<round.roundList.count)
            selectedIndex = randomIndex
            flagImageView.image = UIImage(named: round.roundList[randomIndex].flagImageName)
            firstOptionButton.setTitle(round.roundList[randomIndex].flagAnswerOptions[0].flagFirstOption, for: .normal)
            secondOptionButton.setTitle(round.roundList[randomIndex].flagAnswerOptions[0].flagSecondOption, for: .normal)
            CustomTags.flagCorrectOption = round.roundList[randomIndex].flagCorrectOption
        }
        
    }
    
    // MARK: Actions
    @IBAction func checkAnswerFirstOption(_ sender: UIButton) {
        let viewTag = sender.tag
        checkAnswer(button: viewTag)
        sender.pulsate()
    }
    
    @IBAction func checkAnswerSecondOption(_ sender: UIButton) {
        let viewTag = sender.tag
        checkAnswer(button: viewTag)
        sender.pulsate()
    }
    
    @IBAction func goFoward(_ sender: UIButton) {
        if roundsLeft == 1 {
            performSegue(withIdentifier: "finalResult", sender: self)
        } else {
            roundList?.roundList.remove(at: selectedIndex)
            
            firstOptionButton.backgroundColor = UIColor.primaryColor
            secondOptionButton.backgroundColor = UIColor.primaryColor
            
            firstOptionButton.isUserInteractionEnabled = true
            secondOptionButton.isUserInteractionEnabled = true
            
            goFowardButton.isUserInteractionEnabled = false
            goFowardButton.alpha = 0.5
            roundsLeft -= 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultGameVC
        vc.finalScore = scoreValue
    }
    
}
