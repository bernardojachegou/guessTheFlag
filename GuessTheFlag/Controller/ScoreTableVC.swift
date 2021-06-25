//
//  TableViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 22/04/21.
//

import UIKit

class ScoreTableVC: UITableViewController {
    
    var scores: [Scoreboard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.shadowColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let data = UserDefaults.standard.data(forKey: "savedScore") {
            if let decodedScores = try? JSONDecoder().decode([Scoreboard].self, from: data) {
                scores = decodedScores
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scoreTableTitlesCell")
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userScoreValues", for: indexPath) as! ScoreTableViewCell
            let score = scores[indexPath.row - 1]
            cell.userNameLabel.text = score.userName
            cell.userScoreLabel.text = score.userScore
            
            return cell
        }
    }
    
}
