//
//  RoundViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 26/06/21.
//

import UIKit

class RoundViewController: UIViewController {
    
    private lazy var countRoundsLabel = buildCountRoundsLabel(with: "4/13\nRounds")
    private lazy var navigationTitleView = buildCountRoundsView()
    private lazy var progressBar = buildProgressBar()
    private lazy var backgroundFlagView = buildBackgroundflagView()
    private lazy var flagImageView = buildFlagImageView(with: "br")
    private lazy var firstOptionButton = buildAnswerButton(with: "Brazil")
    private lazy var secondOptionButton = buildAnswerButton(with: "Argentina")
    private lazy var stackView = buildButtonsStackView()
    private lazy var goFowardButton = buildGoFowardButton()
    
    private var timer = Timer()
    private var counter = 30
    
    override func viewDidLoad() {
        view.backgroundColor = .primaryColor
        configureNavigationBar()
        addView()
        startTimer()
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
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
            goFowardButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance?.backgroundColor = .primaryColor
        navigationItem.standardAppearance?.shadowColor = .primaryColor
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = navigationTitleView
    }
    
    private func startTimer() {
        counter = 30
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(onTimerTick),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func onTimerTick() {
        counter != 0 ? counter -= 1 : timer.invalidate()
        progressBar.setProgress(Float(counter)/30.0, animated: true)
    }
    
    @objc private func onAnswerButtonTap(_ sender: UIButton) {
        sender.flash()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
    
    @objc private func onGoFowardButtonTap(_ sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
        navigationController?.pushViewController(ResultBoardViewController(), animated: true)
    }
}

private extension RoundViewController {
    private func buildCountRoundsLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 2
        label.textColor = .primaryColor
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .callout)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildCountRoundsView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 5
        view.addSubview(countRoundsLabel)
        return view
    }
    
    private func buildProgressBar() -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .secondaryColor
        progressView.tintColor = .secondaryShadowColor
        progressView.setProgress(1, animated: false)
        progressView.layer.progressShadow()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }
    
    private func buildBackgroundflagView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 0
        view.addSubview(flagImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildFlagImageView(with imageName: String) -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildAnswerButton(with title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .secondaryColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(.primaryColor, for: .normal)
        button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title2)
        button.layer.cornerRadius = 10
        button.layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
        button.addTarget(self, action: #selector(onAnswerButtonTap), for: .touchUpInside)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }
    
    private func buildButtonsStackView() -> UIStackView {
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
        button.backgroundColor = .secondaryColor
        button.setTitle("Go".uppercased(), for: .normal)
        button.setTitleColor(.primaryColor, for: .normal)
        button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.addTarget(self, action: #selector(onGoFowardButtonTap), for: .touchUpInside)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
