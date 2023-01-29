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

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func loadView() {
            view = mainView
        }

        // MARK: Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        // MARK: Custom Methods


        // MARK: Actions
        @objc
        private func doneButtonDidTap() {
//            mainView.
        }
    }
}
