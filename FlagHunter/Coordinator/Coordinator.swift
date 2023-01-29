//
//  Coordinator.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 18/09/22.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
