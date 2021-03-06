//
//  ScoreboardTableViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 12/07/21.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {
    
    private lazy var navigationTitle = buildScoreboardTitleView()
    var scores: [Scoreboard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondaryColor
        configureNavigationBar()
        tableView.register(ScoreboardTableViewCell.self, forCellReuseIdentifier: ScoreboardTableViewCell.identifier)
        loadData()
    }
    
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: "savedScore") {
            if let decodedScores = try? JSONDecoder().decode([Scoreboard].self, from: data) {
                scores = decodedScores
            }
        }
        tableView.reloadData()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.update(backgroundColor: .secondaryColor, shadowColor: .secondaryColor)
        
        let appearance = UINavigationBarAppearance()
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance?.backgroundColor = .secondaryColor
        navigationItem.standardAppearance?.shadowColor = .secondaryColor
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = navigationTitle
    }
    
    private func buildScoreboardTitleView() -> UIView {
        let label = UILabel()
        label.text = "Scoreboard"
        label.textColor = .secondaryColor
        label.adjustsFontForContentSizeCategory = false
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView()
        view.backgroundColor = .primaryColor
        view.layer.cornerRadius = 5
        view.layer.customEffectShadow(with: UIColor.primaryShadowColor.cgColor)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 170),
            view.heightAnchor.constraint(equalToConstant: 38),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        return view
    }
    
    // MARK: - TableView dataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = ScoreboardTitleTableViewCell()
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreboardTableViewCell.identifier, for: indexPath) as? ScoreboardTableViewCell {
            
            let sortedScore = scores.sorted {
                if let playerScoreSet = Int($0.userScore), let nextPlayerScoreSet = Int($1.userScore) {
                    return playerScoreSet > nextPlayerScoreSet
                }
                return true
            }
            
            let score = sortedScore[indexPath.row]
            cell.userNameLabel.text = score.userName
            cell.userScoreLabel.text = score.userScore
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }
}

