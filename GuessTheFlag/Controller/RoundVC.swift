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
        firstOptionButton.setTitle(roundList.round[0].flagImageName, for: .normal)      }
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    
    roundList = readLocalJson(fileName: "database")
    
    loadJson(fileName: "database")
    
    
//    if let localData = self.readLocalFile(forName: "database") {
//      self.parse(jsonData: localData)
//    }
    
  }
  
//  func readLocalFile(forName name: String) -> Data? {
//    do {
//      if let bundlePath = Bundle.main.path(forResource: name,
//                                           ofType: "json"),
//         let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//        return jsonData
//      }
//    } catch {
//      print(error)
//    }
//
//    return nil
//  }
//
//

}
