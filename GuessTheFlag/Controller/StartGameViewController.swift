//
//  StartGameCodeVC.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 30/04/21.
//

import UIKit

class StartGameViewController: UIViewController {
    
    private lazy var titleImageView = buildTitleImageView()
    private lazy var kidsImageView = buildKidsImageView()
    private lazy var playButton = buildStartButton()
    private lazy var scoreButton = buildScoreButton()
    private lazy var stackView = buildStackView()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.primaryColor
        addView()
        super.viewDidLoad()
    }
    
    private func addView() {
        view.addSubview(titleImageView)
        view.addSubview(kidsImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            kidsImageView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 40),
            kidsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
            
        ])
    }
    
    @objc func onPlayButtonTap(sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
    
    @objc func onScoreButtonTap(sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
}

private extension StartGameViewController {
    private func buildTitleImageView() -> UIImageView {
        let logo = UIImage(named: "flagHunter.png")
        let imageView = UIImageView()
        imageView.image = logo
        imageView.frame = CGRect(x: 0, y: 0, width: logo?.size.width ?? 250, height: logo?.size.height ?? 100)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildKidsImageView() -> UIImageView {
        let logo = UIImage(named: "kidsLogo.png")
        let imageView = UIImageView()
        imageView.image = logo
        imageView.frame = CGRect(x: 0, y: 0, width: logo?.size.width ?? 250, height: logo?.size.height ?? 250)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildStartButton() -> UIButton {
        let button = UIButton()
        button.setTitle("PLAY", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-bold", size: 32)
        button.setTitleColor(UIColor.primaryColor, for: .normal)
        button.backgroundColor = UIColor.secondaryColor
        button.addTarget(self, action: #selector(onPlayButtonTap), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 5, height: 5)
        button.layer.shadowRadius = 0
        return button
    }
    
    private func buildScoreButton() -> UIButton {
        let button = UIButton()
        button.setTitle("SCORE", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-bold", size: 32)
        button.setTitleColor(UIColor.primaryColor, for: .normal)
        button.backgroundColor = UIColor.secondaryColor
        button.addTarget(self, action: #selector(onScoreButtonTap), for: .touchUpInside)
        button.layer.cornerRadius = 25
//        button.layer.shadowColor = UIColor.shadowColor.cgColor
//        button.layer.shadowOpacity = 1
//        button.layer.shadowOffset = .zero
//        button.layer.shadowRadius = 10
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
