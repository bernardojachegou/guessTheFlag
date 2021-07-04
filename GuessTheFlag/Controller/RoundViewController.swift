//
//  RoundViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 26/06/21.
//

import UIKit

class RoundViewController: UIViewController {
    
    private lazy var countRoundsLabel = buildCountRoundsLabel()
    private lazy var navigationTitleView = buildCountRoundsView()
    private lazy var progressBar = buildProgressBar()
    private lazy var backgroundFlagView = buildBackgroundflagView()
    private lazy var flagImageView = buildFlagImageView()
    private lazy var firstOptionButton = buildAnswerOptionButton(with: "Brazil")
    private lazy var secondOptionButton = buildAnswerOptionButton(with: "Argentina")
    private lazy var stackView = buildButtonStackView()
    private lazy var goFowardButton = buildGoFowardButton()
    
    private var timer = Timer()
    private var counter = 10
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.primaryColor
        configureNavigationBar()
        addView()
        onTimerTick()
        super.viewDidLoad()
    }
    
    private func addView() {
        view.addSubview(progressBar)
        view.addSubview(backgroundFlagView)
        view.addSubview(stackView)
        view.addSubview(goFowardButton)
        
        NSLayoutConstraint.activate([
            navigationTitleView.widthAnchor.constraint(equalToConstant: 70),
            navigationTitleView.heightAnchor.constraint(equalToConstant: 44),
            
            countRoundsLabel.topAnchor.constraint(equalTo: navigationTitleView.topAnchor),
            countRoundsLabel.leadingAnchor.constraint(equalTo: navigationTitleView.leadingAnchor),
            countRoundsLabel.trailingAnchor.constraint(equalTo: navigationTitleView.trailingAnchor),
            countRoundsLabel.bottomAnchor.constraint(equalTo: navigationTitleView.bottomAnchor),
            
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -2),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 2),
            
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
            goFowardButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance?.backgroundColor = UIColor.primaryColor
        navigationItem.standardAppearance?.shadowColor = UIColor.primaryColor
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = navigationTitleView
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(onTimerTick),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func onTimerTick() {
        counter != 0 ? counter -= 1 : timer.invalidate()
        progressBar.setProgress(Float(counter), animated: true)
    }
    
    @objc private func checkAnswer(_ sender: UIButton) {
        sender.flash()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
    
    @objc private func goFoward(_ sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
        navigationController?.pushViewController(ResultBoardViewController(), animated: true)
    }
}

private extension RoundViewController {
    private func buildCountRoundsLabel() -> UILabel {
        let label = UILabel()
        label.text = "Rounds 4/13"
        label.numberOfLines = 2
        label.textColor = UIColor.primaryColor
        label.font = UIFont.robotoBold(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildCountRoundsView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.layer.cornerRadius = 10
        view.addSubview(countRoundsLabel)
        return view
    }
    
    private func buildProgressBar() -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = UIColor.secondaryColor
        progressView.tintColor = UIColor.secondaryShadowColor
        progressView.layer.shadowColor = UIColor.black.cgColor
        progressView.layer.shadowOffset = .init(width: 0, height: 3)
        progressView.layer.shadowOpacity = 0.3
        progressView.layer.shadowRadius = 3
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }
    
    private func buildBackgroundflagView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 0
        view.addSubview(flagImageView)
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
        button.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
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
        button.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.addTarget(self, action: #selector(goFoward), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
