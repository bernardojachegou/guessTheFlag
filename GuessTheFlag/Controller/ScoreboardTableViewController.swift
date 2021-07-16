//
//  ScoreboardTableViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 12/07/21.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {
    
    private lazy var navigationTitle = buildScoreboardTitleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = UIColor.secondaryColor
        tableView.register(ScoreboardTableViewCell.self, forCellReuseIdentifier: ScoreboardTableViewCell.identifier)
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance?.backgroundColor = UIColor.secondaryColor
        navigationItem.standardAppearance?.shadowColor = UIColor.primaryColor
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = navigationTitle
    }
    
    private func buildScoreboardTitleView() -> UIView {
        let label = UILabel()
        label.text = "Scoreboard"
        label.textColor = UIColor.secondaryColor
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView()
        view.backgroundColor = UIColor.primaryColor
        view.layer.cornerRadius = 10
        view.layer.customShadow(with: UIColor.primaryShadowColor.cgColor)
        view.addSubview(label)
        view.widthAnchor.constraint(equalToConstant: 170).isActive = true
        view.heightAnchor.constraint(equalToConstant: 38).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ScoreboardTableViewCell.identifier, for: indexPath) as? ScoreboardTableViewCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = ScoreboardTitleTableViewCell()
        return headerCell
        
    }
}

