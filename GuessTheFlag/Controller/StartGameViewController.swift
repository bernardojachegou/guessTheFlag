//
//  StartGameCodeVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 30/04/21.
//

import UIKit

class StartGameViewController: UIViewController {
    
    private lazy var titleImageView = buildImageView(using: "flagHunter")
    private lazy var heroImageView = buildImageView(using: "kidsLogo")
    private lazy var playButton = buildSmallButton(with: "PLAY", action: #selector (onPlayButtonTap))
    private lazy var scoreButton = buildSmallButton(with: "SCORE", action: #selector(onScoreButtonTap))
    private lazy var stackView = buildStackView()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.primaryColor
        addView()
        super.viewDidLoad()
    }
    
    private func addView() {
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
    
    @objc private func onPlayButtonTap(sender: UIButton) {
        sender.pulsate()
        let navigation = UINavigationController(rootViewController: RoundViewController())
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    
    @objc private func onScoreButtonTap(sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
        let scoreboard = ScoreboardTableViewController()
        scoreboard.modalPresentationStyle = .popover
        present(scoreboard, animated: true, completion: nil)
    }
}

private extension StartGameViewController {
    private func buildImageView(using imageName: String) -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildSmallButton(with title: String, action selector: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        button.setTitleColor(UIColor.primaryColor, for: .normal)
        button.backgroundColor = UIColor.secondaryColor
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
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
