//
//  RoundViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 26/06/21.
//

import UIKit

class RoundViewController: UIViewController {
    
    class CustomTags {
        static let firstOptionButtonTag = 80
        static let secondOptionButtonTag = 81
        static var flagCorrectOption = 0
    }
    
//    private lazy var countRoundsLabel = buildCountRoundsLabel()
    private lazy var navigationTitleView = buildCountRoundsView()
    private lazy var backgroundFlagView = buildBackgroundflagView()
    private lazy var flagImageView = buildFlagImageView()
    private lazy var firstOptionButton = buildAnswerOptionButton(with: "Brazil")
    private lazy var secondOptionButton = buildAnswerOptionButton(with: "Argentina")
    private lazy var stackView = buildButtonStackView()
    private lazy var goFowardButton = buildGoFowardButton()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.primaryColor
        addView()
        configureNavigationBar()
        super.viewDidLoad()
        
    }
    
    private func addView() {
        view.addSubview(backgroundFlagView)
        backgroundFlagView.addSubview(flagImageView)
        view.addSubview(stackView)
        view.addSubview(goFowardButton)
        
        NSLayoutConstraint.activate([
            backgroundFlagView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            backgroundFlagView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backgroundFlagView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            flagImageView.topAnchor.constraint(equalTo: backgroundFlagView.topAnchor, constant: 20),
            flagImageView.leadingAnchor.constraint(equalTo: backgroundFlagView.leadingAnchor, constant: 20),
            flagImageView.trailingAnchor.constraint(equalTo: backgroundFlagView.trailingAnchor, constant: -20),
            flagImageView.bottomAnchor.constraint(equalTo: backgroundFlagView.bottomAnchor, constant: -20),
            
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: backgroundFlagView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: backgroundFlagView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: backgroundFlagView.trailingAnchor),
            
            goFowardButton.heightAnchor.constraint(equalToConstant: 50),
            goFowardButton.leadingAnchor.constraint(equalTo: backgroundFlagView.leadingAnchor),
            goFowardButton.trailingAnchor.constraint(equalTo: backgroundFlagView.trailingAnchor),
            goFowardButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
//            countRoundsLabel.topAnchor.constraint(equalTo: navigationTitleView.topAnchor),
//            countRoundsLabel.leadingAnchor.constraint(equalTo: navigationTitleView.leadingAnchor),
//            countRoundsLabel.trailingAnchor.constraint(equalTo: navigationTitleView.trailingAnchor),
//            countRoundsLabel.bottomAnchor.constraint(equalTo: navigationTitleView.bottomAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance?.backgroundColor = UIColor.primaryColor
        navigationItem.standardAppearance?.shadowColor = UIColor.secondaryColor
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = navigationTitleView
    }
    
    @objc private func checkAnswer(_ sender: UIButton) {
        sender.flash()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
    
    @objc private func goFoward(_ sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
    
}

private extension RoundViewController {
    private func buildCountRoundsLabel() -> UILabel {
        let label = UILabel()
        label.text = "4/13\nRounds"
        label.textColor = UIColor.primaryColor
        label.font = UIFont.robotoBold(ofSize: 14)
        return label
    }
    
    private func buildCountRoundsView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 100)
        view.backgroundColor = UIColor.secondaryColor
        view.layer.cornerRadius = 10
        return view
    }
    
    private func progressBar() -> UIProgressView {
        let progressView = UIProgressView()
        
        return progressView
    }
    
    private func buildBackgroundflagView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.shadowColor.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildFlagImageView() -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: "br")
        imageView.image = image
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildAnswerOptionButton(with title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.secondaryColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.primaryColor, for: .normal)
        button.titleLabel?.font = UIFont.robotoBold(ofSize: 24)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        return button
    }
    
    private func buildButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.addArrangedSubview(firstOptionButton)
        stackView.addArrangedSubview(secondOptionButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func buildGoFowardButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.secondaryColor
        button.setTitle("GO", for: .normal)
        button.setTitleColor(UIColor.primaryColor, for: .normal)
        button.titleLabel?.font = UIFont.robotoBold(ofSize: 32)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.addTarget(self, action: #selector(goFoward), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
