//
//  Scene.FlagHunter.Start.ViewModel.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 29/01/23.
//

extension Scene.FlagHunter.Start {
    class ViewModel: Coordinating {

        var coordinator: Coordinator?

        init(coordinator: MainCoordinator) {
            self.coordinator = coordinator
        }

        func closeView() {
            print("Done something!")
        }
    }
}
