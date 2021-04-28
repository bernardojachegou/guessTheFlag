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
      if let round = roundList {
        flagImageView.image = UIImage(named: round.roundList[1].flagImageName)
        firstOptionButton.setTitle(round.roundList[1].flagAnswerOptions[0].flagFirstOption, for: .normal)
        secondOptionButton.setTitle(round.roundList[1].flagAnswerOptions[0].flagSecondOption, for: .normal)
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
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    
    roundList = loadJsonFile(fileName: "database")
    scoreValue = 0
  }
  
  //MARK: Actions
  @IBAction func checkAnswerFirstOption(_ sender: UIButton) {
    //    if correctAnswer {
    //      scoreValue += 1
    //    } else {
    //      scoreValue += 0
    //    }
    // Depois desativa ambos os botões
    scoreValue += 1
  }
  
  @IBAction func checkAnswerSecondOption(_ sender: UIButton) {
    scoreValue += 1
  }
  
  
  @IBAction func goFoward(_ sender: UIButton) {
    print("tapping the goFoward Button")
    // se a resposta já foi escolhida && e se o array ainda for < 10 { traga os valores da próxima possição do array }
    // caso contrário traga tela de conclusão
  }
  
  
  //MARK: Methods
  //  func checkRoundAnswer() -> Bool {
  //    var correctAnswer: Bool = false
  //
  //    if round.roundList[0].flagImageName == round.roundList[1].flagAnswerOptions[0].flagFirstOption {
  //      correctAnswer = true
  //    }
  //    return correctAnswer
  //  }
  
}
