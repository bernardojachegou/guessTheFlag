//
//  MainCoordinator.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 18/09/22.
//

import UIKit

class MainCoordinator: Coordinator {

    // MARK: Properties
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func trigger(_ type: Route) {
        switch type {
        case .round:
            let viewController = RoundViewController()
            pushController(viewController)
        case .scoreboard:
            let viewController = ScoreboardTableViewController()
            pushController(viewController)
        case .result:
            return
        }
    }

    func start() {
        let viewModel = Scene.FlagHunter.Start.ViewModel(coordinator: self)
        let viewController = Scene.FlagHunter.Start.ViewController(viewModel: viewModel)
        pushController(viewController, false)
    }

    private func pushController(_ viewController: UIViewController, _ animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}