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
            navigationController.pushViewController(viewController, animated: true)
        }
    }

    func start() {
        let viewController = StartGameViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }


}
