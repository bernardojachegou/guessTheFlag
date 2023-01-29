//
//  Coordinator.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 18/09/22.
//

import Foundation
import UIKit

enum Route {
    case round
    case scoreboard
    case result
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func trigger(_ type: Route)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
