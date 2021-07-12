//
//  ResultBoardViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 27/06/21.
//

import UIKit

class ResultBoardViewController: UIViewController {
    
    private lazy var countRoundsLabel = buildCountRoundsLabel(with: "Done!")
    private lazy var navigationTitleView = buildCountRoundsView()
    private lazy var progressBar = buildProgressBar()
    private lazy var trophyImageView = buildTrophyImageView()
    private lazy var conditionalMessage = buildConditionalMessage()
    private lazy var scoreBackgroundView = buildScoreBackgroundView()
    private lazy var correctAnswersView = buildCorrectAnswersView()
    private lazy var wrongAnswersView = buildWrongAnswersView()
    private lazy var finalScoreView = buildFinalScoreView()
    private lazy var userNameTextField = buildInputTextField()
    private lazy var saveGameButton = buildSaveButton()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.primaryColor
        super.viewDidLoad()
        addSubview()
        configureNavigationBar()
    }
    
    private func addSubview() {
        view.addSubview(progressBar)
        view.addSubview(trophyImageView)
        view.addSubview(conditionalMessage)
        view.addSubview(scoreBackgroundView)
        scoreBackgroundView.addSubview(correctAnswersView)
        scoreBackgroundView.addSubview(wrongAnswersView)
        scoreBackgroundView.addSubview(finalScoreView)
        scoreBackgroundView.addSubview(userNameTextField)
        scoreBackgroundView.addSubview(saveGameButton)
        
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
            
            trophyImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            trophyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            conditionalMessage.topAnchor.constraint(equalTo: trophyImageView.bottomAnchor, constant: 20),
            conditionalMessage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            conditionalMessage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            scoreBackgroundView.topAnchor.constraint(equalTo: conditionalMessage.bottomAnchor, constant: 20),
            scoreBackgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scoreBackgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scoreBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            correctAnswersView.topAnchor.constraint(equalTo: scoreBackgroundView.topAnchor, constant: 20),
            correctAnswersView.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            correctAnswersView.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            wrongAnswersView.topAnchor.constraint(equalTo: correctAnswersView.bottomAnchor, constant: 20),
            wrongAnswersView.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            wrongAnswersView.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            finalScoreView.topAnchor.constraint(equalTo: wrongAnswersView.bottomAnchor, constant: 20),
            finalScoreView.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            finalScoreView.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: finalScoreView.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            saveGameButton.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            saveGameButton.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            saveGameButton.bottomAnchor.constraint(equalTo: scoreBackgroundView.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationItem.standardAppearance = appearance
        navigationItem.standardAppearance?.backgroundColor = UIColor.primaryColor
        navigationItem.standardAppearance?.shadowColor = UIColor.primaryColor
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = navigationTitleView
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @objc private func saveGame(_ sender: UIButton) {
        sender.pulsate()
        print("\(String(describing: sender.titleLabel?.text)) was pressed!")
    }
}

extension ResultBoardViewController {
    private func buildCountRoundsLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 2
        label.textColor = UIColor.primaryColor
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .subheadline)
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
        progressView.setProgress(0, animated: false)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }
    
    private func buildTrophyImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trophy")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func buildConditionalMessage() -> BlueBackgroundView {
        let view = BlueBackgroundView()
        view.messageLabel.text = "You are the Best Player!"
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildScoreBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildCorrectAnswersView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Correct answers: "
        view.scorePointLabel.text = "60"
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildWrongAnswersView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Wrong answers: "
        view.scorePointLabel.text = "40"
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildFinalScoreView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Final score: "
        view.scorePointLabel.text = "100"
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildInputTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = "Type your name"
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func buildSaveButton() -> UIView {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        button.setTitleColor(UIColor.secondaryColor, for: .normal)
        button.backgroundColor = UIColor.primaryColor
        button.addTarget(self, action: #selector(saveGame), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.primaryShadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
