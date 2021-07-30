//
//  ResultBoardViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 27/06/21.
//

import UIKit

class ResultBoardViewController: UIViewController {
    
    private lazy var navigationTitleView = buildCountRoundsView(with: "Done!")
    private lazy var progressBar = buildProgressBar()
    private lazy var trophyImageView = buildTrophyImageView()
    private lazy var conditionalMessage = buildConditionalMessage(with: handleConditionalMessage())
    private lazy var scoreBackgroundView = buildScoreBackgroundView()
    private lazy var correctAnswersView = buildCorrectAnswersView()
    private lazy var wrongAnswersView = buildWrongAnswersView()
    private lazy var finalScoreView = buildFinalScoreView()
    private lazy var userNameTextField = buildInputTextField()
    private lazy var saveGameButton = buildSaveButton()
//    private lazy var buttonBottomAnchorConstraint = saveGameButton.bottomAnchor.constraint(equalTo: scoreBackgroundView.bottomAnchor, constant: -24)
    
    var finalscore = 0
    var totalCorrectAnswers = 0
    var totalWrongAnswers = 0
    
    override func viewDidLoad() {
        view.backgroundColor = .primaryColor
        super.viewDidLoad()
        addView()
        configureNavigationBar()
        subscribeKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeKeyboardNotifications()
    }
    
    private func addView() {
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
            
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -2),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 2),
            
            trophyImageView.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 10),
            trophyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            conditionalMessage.topAnchor.constraint(equalTo: trophyImageView.bottomAnchor, constant: 10),
            conditionalMessage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            conditionalMessage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            scoreBackgroundView.topAnchor.constraint(equalTo: conditionalMessage.bottomAnchor, constant: 20),
            scoreBackgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scoreBackgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scoreBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            correctAnswersView.topAnchor.constraint(equalTo: scoreBackgroundView.topAnchor, constant: 20),
            correctAnswersView.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            correctAnswersView.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            wrongAnswersView.topAnchor.constraint(equalTo: correctAnswersView.bottomAnchor, constant: 20),
            wrongAnswersView.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            wrongAnswersView.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            finalScoreView.topAnchor.constraint(equalTo: wrongAnswersView.bottomAnchor, constant: 20),
            finalScoreView.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            finalScoreView.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            
            userNameTextField.topAnchor.constraint(greaterThanOrEqualTo: finalScoreView.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: conditionalMessage.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: conditionalMessage.trailingAnchor),
            userNameTextField.bottomAnchor.constraint(equalTo: saveGameButton.topAnchor, constant: -20),
            
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
    
    @objc private func onSaveGameButtonTap(_ sender: UIButton) {
        if (userNameTextField.text?.count ?? 0) > 0 {
            
            // It's not working.....
            saveGameButton.isUserInteractionEnabled = true
            saveGameButton.alpha = 1.0
            
            var scores: [Scoreboard] = []
            
            if let data = UserDefaults.standard.data(forKey: "savedScore") {
                if let decodedScores = try? JSONDecoder().decode([Scoreboard].self, from: data) {
                    scores = decodedScores
                }
            }

            // Must be unwrapped
            let scoreboard = Scoreboard(userName: userNameTextField.text!, userScore: String(finalscore))
            scores.append(scoreboard)

            if let savedScore = try? JSONEncoder().encode(scores) {
                UserDefaults.standard.set(savedScore, forKey: "savedScore")
                UserDefaults.standard.synchronize()
            }
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func handleConditionalMessage() -> String {
        var message = ""
        if totalCorrectAnswers >= 8 {
            message = "You are the best player!"
        } else if totalCorrectAnswers > 5 && totalCorrectAnswers < 8 {
            message = "You are a good player!"
        } else {
            message = "You must improve your skills :("
        }
        return message
    }
    
    private func handleFinalScoreValue() -> Int {
        if finalscore <= 0 {
            return 0
        } else {
            return finalscore
        }
    }

}

extension ResultBoardViewController {

    private func subscribeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    private func unsubscribeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

//    func updateButtonBottomAnchorConstraint(with constant: CGFloat) {
//        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
//            self.buttonBottomAnchorConstraint.constant = constant
//            self.view.layoutIfNeeded()
//        })
//    }
}

extension ResultBoardViewController {
    private func buildCountRoundsView(with text: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 1
        label.textColor = .primaryColor
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .headline)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        let view = UIView()
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 5
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        return view
    }
    
    private func buildProgressBar() -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .secondaryColor
        progressView.tintColor = .secondaryShadowColor
        progressView.layer.progressShadow()
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
    
    private func buildScoreBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildConditionalMessage(with message: String) -> BlueBackgroundView {
        let view = BlueBackgroundView()
        view.messageLabel.text = message
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildCorrectAnswersView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Correct answers: "
        view.scorePointLabel.text = String(totalCorrectAnswers)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildWrongAnswersView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Wrong answers: "
        view.scorePointLabel.text = String(totalWrongAnswers)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildFinalScoreView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Final score: "
        view.scorePointLabel.text = String(handleFinalScoreValue())
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildInputTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = "Type your hunter's name here."
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func buildSaveButton() -> UIView {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        button.setTitleColor(.secondaryColor, for: .normal)
        button.backgroundColor = .primaryColor
        button.layer.cornerRadius = 10
        button.layer.customEffectShadow(with: UIColor.primaryShadowColor.cgColor)
        button.addTarget(self, action: #selector(onSaveGameButtonTap), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.isUserInteractionEnabled = false
        button.alpha = 0.5
        return button
    }
}
