//
//  Scene.FlagHunter.Start.View.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 29/01/23.
//

import Foundation
import UIKit

extension Scene.FlagHunter.Start {
    class View: UIView, CodeView {

        // MARK: Components
        private let contentView: UIView = {
            let view = UIView()
            view.backgroundColor = .green
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        private let titleImage: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(named: "flagHunter")
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        private let backgroundImage: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(named: "kidsLogo")
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        private let buttonsStack: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()

        let playButton: UIButton = {
            let button = UIButton()
            button.setTitle("PLAY", for: .normal)
            button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
            button.setTitleColor(.primaryColor, for: .normal)
            button.backgroundColor = .secondaryColor
            button.layer.cornerRadius = 10
            button.layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
            button.titleLabel?.adjustsFontForContentSizeCategory = true
            return button
        }()

        let scoreButton: UIButton = {
            let button = UIButton()
            button.setTitle("SCORE", for: .normal)
            button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
            button.setTitleColor(.primaryColor, for: .normal)
            button.backgroundColor = .secondaryColor
            button.layer.cornerRadius = 10
            button.layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
            button.titleLabel?.adjustsFontForContentSizeCategory = true
            return button
        }()

        // MARK: Initializers
        init() {
            super.init(frame: .zero)

            setupView()
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            let view: UIView = self

            buttonsStack.addArrangedSubview(playButton)
            buttonsStack.addArrangedSubview(scoreButton)

            contentView.addSubview(titleImage)
            contentView.addSubview(backgroundImage)
            contentView.addSubview(buttonsStack)

            view.addSubview(contentView)
        }

        func setupConstraints() {

            let view: UIView = self

            NSLayoutConstraint.activate([
                titleImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                backgroundImage.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 40),
                backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                buttonsStack.heightAnchor.constraint(equalToConstant: 50),
                buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
                buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
                buttonsStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),

                contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        }

        func setupAdditionalConfiguration() {
            backgroundColor = .green
        }
    }
}
