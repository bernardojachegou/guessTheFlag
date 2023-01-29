//
//  Scene.FlagHunter.Start.ViewModel.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 29/01/23.
//

extension Scene.FlagHunter.Start {
    class ViewModel: Coordinating {

        // MARK: Variables
        var coordinator: Coordinator?

        // MARK: Init
        init(coordinator: MainCoordinator) {
            self.coordinator = coordinator
        }

        // MARK: Custom Methods
        func startGame() {
            #warning("chamar tela para iniciar o jogo")
        }

        func openScoreBoard() {
            #warning("chamar tela de score")
        }

        func closeView() {
            print("Done something!")
        }
    }
}
