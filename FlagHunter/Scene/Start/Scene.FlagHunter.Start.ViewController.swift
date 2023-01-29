//
//  Scene.FlagHunter.Start.ViewController.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 29/01/23.
//

import Foundation
import UIKit

extension Scene.FlagHunter.Start {
    class ViewController: UIViewController {

        // MARK: Components
        let viewModel: ViewModel
        let mainView = View()

        init(viewModel: ViewModel) {
            self.viewModel = viewModel

            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func loadView() {
            view = mainView
        }

        // MARK: Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupStrings()
            setupActions()
        }

        // MARK: Custom Methods
        private func setupActions() {
            mainView.playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
            mainView.scoreButton.addTarget(self, action: #selector(didTapScoreButton), for: .touchUpInside)
        }

        private func setupStrings() {
            mainView.playButton.setTitle("PLAY", for: .normal)
            mainView.scoreButton.setTitle("SCORE", for: .normal)
        }


        // MARK: Actions
        @objc
        private func didTapPlayButton(sender: UIButton) {
            sender.pulsate()
            viewModel.startGame()
        }

        @objc
        private func didTapScoreButton(sender: UIButton) {
            sender.pulsate()
            viewModel.openScoreBoard()

        }
    }
}
