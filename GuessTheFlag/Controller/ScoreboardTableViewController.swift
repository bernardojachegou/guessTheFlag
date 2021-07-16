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
        view.backgroundColor = .secondaryColor
        tableView.register(ScoreboardTableViewCell.self, forCellReuseIdentifier: ScoreboardTableViewCell.identifier)
    }
    
    private func configureNavigationBar() {
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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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

