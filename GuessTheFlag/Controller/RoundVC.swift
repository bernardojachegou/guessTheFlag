//
//  RoundVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 22/04/21.
//

import UIKit

class RoundVC: UIViewController {
  
  class Constants {
    static let firstOptionButtonTag = 80
    static let secondOptionButtonTag = 81
  }
  
  //MARK: Properties
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var flagImageView: UIImageView!
  @IBOutlet weak var firstOptionButton: UIButton!
  @IBOutlet weak var secondOptionButton: UIButton!
  @IBOutlet weak var goFowardButton: UIButton!
  var flagCorrectOption = 0
  var selectedIndex = 0
  
  var roundList: RoundList? {
    didSet {
      if let round = roundList {
        let randomIndex = Int.random(in: 0..<round.roundList.count)
        selectedIndex = randomIndex
        flagImageView.image = UIImage(named: round.roundList[randomIndex].flagImageName)
        firstOptionButton.setTitle(round.roundList[randomIndex].flagAnswerOptions[0].flagFirstOption, for: .normal)
        secondOptionButton.setTitle(round.roundList[randomIndex].flagAnswerOptions[0].flagSecondOption, for: .normal)
        flagCorrectOption = round.roundList[randomIndex].flagCorrectOption
      }
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
    
    prepareButtons()
    roundList = loadJsonFile(fileName: "database")
    scoreValue = 0
  }
  
  //MARK: Methods
  func prepareButtons() {
    goFowardButton.isUserInteractionEnabled = false
    goFowardButton.alpha = 0.5
    firstOptionButton.tag = Constants.firstOptionButtonTag
    secondOptionButton.tag = Constants.secondOptionButtonTag
  }
  
  func checkAnswer(button: Int) {
    if button == flagCorrectOption {
      scoreValue += 1
      if let correctButton = view.viewWithTag(button) {
        correctButton.backgroundColor = UIColor.init(red: 20/255, green: 128/255, blue: 1/255, alpha: 1)
      }
    }
    else {
      if let wrongButton = view.viewWithTag(button) {
        wrongButton.backgroundColor = UIColor.init(red: 179/255, green: 0/255, blue: 33/255, alpha: 1)
      }
    }
    
    if (roundList?.roundList.count)! <= 10 {
      goFowardButton.setTitle("Finish", for: .normal)
    }
    
    firstOptionButton.isUserInteractionEnabled = false
    secondOptionButton.isUserInteractionEnabled = false
    goFowardButton.isUserInteractionEnabled = true
    goFowardButton.alpha = 1.0
  }
  
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
    
    if (roundList?.roundList.count)! > 10 {
      roundList?.roundList.remove(at: selectedIndex)
      firstOptionButton.backgroundColor = UIColor.init(red: 42/255, green: 42/255, blue: 87/255, alpha: 1.0)
      secondOptionButton.backgroundColor = UIColor.init(red: 42/255, green: 42/255, blue: 87/255, alpha: 1.0)
      firstOptionButton.isUserInteractionEnabled = true
      secondOptionButton.isUserInteractionEnabled = true
      goFowardButton.isUserInteractionEnabled = false
      goFowardButton.alpha = 0.5
    } else {
      let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let nextViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "result") as UIViewController
      nextViewController.modalPresentationStyle = .fullScreen
      self.present(nextViewController, animated: true, completion: nil)
    }
  }
  
}
