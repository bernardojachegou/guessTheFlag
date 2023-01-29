//
//  StartGameCodeVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 30/04/21.
//

import UIKit

class StartGameViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?

    // MARK: Properties
    
    private lazy var titleImageView = buildImageView(usingImg: "flagHunter")
    private lazy var heroImageView = buildImageView(usingImg: "kidsLogo")
    private lazy var stackView = buildStackView()
    private lazy var playButton = buildSmallButton(withLabel: "Play", onActionSet: #selector (playButtonTapped))
    private lazy var scoreButton = buildSmallButton(withLabel: "Score", onActionSet: #selector (scoreButtonTapped))
    
    override func viewDidLoad() {
        prepareViewBackground()
        addSubviews()
        super.viewDidLoad()
    }
    
    private func prepareViewBackground() {
        view.backgroundColor = .primaryColor
    }
    
    private func addSubviews() {
        view.addSubview(titleImageView)
        view.addSubview(heroImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            heroImageView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 40),
            heroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    @objc private func playButtonTapped(sender: UIButton) {
        sender.pulsate()
        coordinator?.eventOccurred(with: .buttonTapped)
    }
    
    @objc private func scoreButtonTapped(sender: UIButton) {
        sender.pulsate()
        let navigation = UINavigationController(rootViewController: ScoreboardTableViewController())
        navigation.modalPresentationStyle = .popover
        present(navigation, animated: true, completion: nil)
    }
}

private extension StartGameViewController {
    private func buildImageView(usingImg imageName: String) -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildSmallButton(withLabel title: String, onActionSet selector: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title.uppercased(), for: .normal)
        button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        button.setTitleColor(.primaryColor, for: .normal)
        button.backgroundColor = .secondaryColor
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }
    
    private func buildStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(scoreButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
