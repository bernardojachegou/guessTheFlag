//
//  ScoreboardTableViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 12/07/21.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScoreboardTableView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }


}

private extension ScoreboardTableViewController {
    private func configureScoreboardTableView() {
        view.backgroundColor = UIColor.secondaryColor
    }
}
