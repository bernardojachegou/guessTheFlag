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

    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            let viewController = RoundViewController()
            pushController(viewController)
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
