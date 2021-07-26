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
    
    private lazy var countRoundsLabel = buildCountRoundsLabel(with: "X/X\nCounter")
    private lazy var navigationTitleView = buildCountRoundsView()
    private lazy var progressBar = buildProgressBar()
    private lazy var backgroundFlagView = buildBackgroundflagView()
    private lazy var flagImageView = buildFlagImageView()
    private lazy var firstOptionButton = buildAnswerButton()
    private lazy var secondOptionButton = buildAnswerButton()
    private lazy var stackView = buildButtonsStackView()
    private lazy var goFowardButton = buildGoFowardButton()
    
    private var timer = Timer()
    private var counter = 100
    
    private var selectedIndex = 0
    private var roundsLeft = 10
    private var totalRounds = 10
    
    private var countRounds = 0
    var scoreValue = 0
    var correctAnswers = 0
    var wrongAnswers = 0
    
    var roundList: RoundList? {
        didSet {
            updateViewForNewRound()
            startTimer()
        }
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .primaryColor
        configureNavigationBar()
        addView()
        prepareButtons()
        super.viewDidLoad()
        roundList = loadJsonFile(fileName: "database")
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
        counter = 10
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(onTimerTick),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func onTimerTick() {
        counter != 0 ? counter -= 1 : timer.invalidate()
        progressBar.setProgress(Float(counter)/10.0, animated: true)
    }
    
    func prepareButtons() {
        goFowardButton.isUserInteractionEnabled = false
        goFowardButton.alpha = 0.5
        firstOptionButton.tag = CustomTags.firstOptionButtonTag
        secondOptionButton.tag = CustomTags.secondOptionButtonTag
    }
    
    func checkAnswer(button: Int) {
        if button == CustomTags.flagCorrectOption {
            scoreValue += 30
            correctAnswers += 1
            if let correctButton = view.viewWithTag(button) {
                correctButton.backgroundColor = UIColor.correctAnswerColor
            }
        } else {
            scoreValue -= 5
            wrongAnswers += 1
            if let wrongButton = view.viewWithTag(button) {
                wrongButton.backgroundColor = UIColor.wrongAnswerColor
            }
        }
        
        if roundsLeft == 1 {
            goFowardButton.setTitle("Finish".uppercased(), for: .normal)
        }
        
        firstOptionButton.isUserInteractionEnabled = false
        secondOptionButton.isUserInteractionEnabled = false
        goFowardButton.isUserInteractionEnabled = true
        goFowardButton.alpha = 1.0
    }
    
    func updateViewForNewRound() {
        if let round = roundList {
            countRounds += 1
            countRoundsLabel.text = "\(countRounds)/\(totalRounds)\nRounds"
            let randomIndex = Int.random(in: 0..<round.roundList.count)
            selectedIndex = randomIndex
            flagImageView.image = UIImage(named: round.roundList[randomIndex].flagImageName)
            firstOptionButton.setTitle(round.roundList[randomIndex].flagAnswerOptions[0].flagFirstOption, for: .normal)
            secondOptionButton.setTitle(round.roundList[randomIndex].flagAnswerOptions[0].flagSecondOption, for: .normal)
            CustomTags.flagCorrectOption = round.roundList[randomIndex].flagCorrectOption
        }
    }
    
    func prepareForTheNextRound() {
        roundList?.roundList.remove(at: selectedIndex)
        firstOptionButton.backgroundColor = UIColor.secondaryColor
        secondOptionButton.backgroundColor = UIColor.secondaryColor
        firstOptionButton.isUserInteractionEnabled = true
        secondOptionButton.isUserInteractionEnabled = true
        goFowardButton.isUserInteractionEnabled = false
        goFowardButton.alpha = 0.5
        roundsLeft -= 1
    }
    
    @objc private func onAnswerButtonTap(_ sender: UIButton) {
        sender.flash()
        let viewTag = sender.tag
        checkAnswer(button: viewTag)
    }
    
    @objc private func onGoFowardButtonTap(_ sender: UIButton) {
        print("Updated Score: \(scoreValue)\nCorrect Answers: \(correctAnswers)\nWrong Answers: \(wrongAnswers)")
        sender.pulsate()
        let seconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            if self.roundsLeft != 1 {
                self.prepareForTheNextRound()
            } else {
                self.navigationController?.pushViewController(ResultBoardViewController(), animated: true)
                if let vc = self.navigationController?.topViewController as? ResultBoardViewController {
                    vc.finalscore = self.scoreValue
                    vc.totalCorrectAnswers = self.correctAnswers
                    vc.totalWrongAnswers = self.wrongAnswers
                }
            }
            
        }
    }
    
}

private extension RoundViewController {
    private func buildCountRoundsLabel(with text: String?) -> UILabel {
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
        view.layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
        view.addSubview(flagImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildFlagImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.heightAnchor.constraint(equalToConstant: 175).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildAnswerButton() -> UIButton {
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
