//
//  ResultBoardViewController.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 27/06/21.
//

import UIKit

class ResultBoardViewController: UIViewController {
    
    private lazy var containerView = makeContainerView()
    private lazy var scrollView = makeScrollView()
    private lazy var navigationTitleView = buildCountRoundsView(with: "Done!")
    private lazy var progressBar = buildProgressBar()
    private lazy var trophyImageView = buildTrophyImageView()
    private lazy var conditionalMessage = buildConditionalMessage(with: handleConditionalMessage())
    private lazy var scoreBackgroundView = buildScoreResultBackgroundView()
    private lazy var bgBottomAnchorConstraint = scoreBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

    let maxLength = 15
    var finalscore = 0
    var totalCorrectAnswers = 0
    var totalWrongAnswers = 0
    
    deinit {
        unsubscribeKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .primaryColor
        super.viewDidLoad()
        addView()
        configureNavigationBar()
        subscribeKeyboardNotifications()
        
        let endEditingGesture = UITapGestureRecognizer (target: self, action: #selector(endEditingTapped(_:)))
        view.addGestureRecognizer(endEditingGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeKeyboardNotifications()
    }
    
    private func addView() {
        view.addSubview(scrollView)
        containerView.addSubview(progressBar)
        containerView.addSubview(trophyImageView)
        containerView.addSubview(conditionalMessage)
        containerView.addSubview(scoreBackgroundView)
        
        let containerViewHeight = scrollView.frameLayoutGuide.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor)
        containerViewHeight.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            // Fix the size and position of the scroll view frame
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.frameLayoutGuide.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.frameLayoutGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            // Pinning the content container view to the scroll view
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            // Fixes the width and height of the content area
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: scrollView.contentLayoutGuide.widthAnchor),
            containerViewHeight
        ])
        
        NSLayoutConstraint.activate([
            navigationTitleView.widthAnchor.constraint(equalToConstant: 70),
            navigationTitleView.heightAnchor.constraint(equalToConstant: 44),
            
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -2),
            progressBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 2),

            trophyImageView.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 10),
            trophyImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            conditionalMessage.topAnchor.constraint(equalTo: trophyImageView.bottomAnchor, constant: 10),
            conditionalMessage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            conditionalMessage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            scoreBackgroundView.topAnchor.constraint(equalTo: conditionalMessage.bottomAnchor, constant: 20),
            scoreBackgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scoreBackgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scoreBackgroundView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
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
    
    @objc func endEditingTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func onSaveGameButtonTap(_ sender: UIButton) {
//        if (userNameTextField.text?.count ?? 0) > 0 {
//
//
//            var scores: [Scoreboard] = []
//
//            if let data = UserDefaults.standard.data(forKey: "savedScore") {
//                if let decodedScores = try? JSONDecoder().decode([Scoreboard].self, from: data) {
//                    scores = decodedScores
//                }
//            }
//
//            // Must be unwrapped
//            let scoreboard = Scoreboard(userName: userNameTextField.text!, userScore: String(finalscore))
//            scores.append(scoreboard)
//
//            if let savedScore = try? JSONEncoder().encode(scores) {
//                UserDefaults.standard.set(savedScore, forKey: "savedScore")
//                UserDefaults.standard.synchronize()
//            }
//
//        }
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
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        updateButtonBottomAnchorConstraint(with: (keyboardHeight + (UIScreen.main.bounds.width == 320 ? 4 : 20)) * -1)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        updateButtonBottomAnchorConstraint(with: -20)
    }
    
    func updateButtonBottomAnchorConstraint(with constant: CGFloat) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.bgBottomAnchorConstraint.constant = constant
            self.view.layoutIfNeeded()
        })
    }
}

extension ResultBoardViewController {
    private func makeContainerView() -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }
    
    private func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.addSubview(containerView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
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
    
    
    private func buildConditionalMessage(with message: String) -> BlueBackgroundView {
        let view = BlueBackgroundView()
        view.messageLabel.text = message
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildScoreResultBackgroundView() -> ScoreResultBackgroundView {
        let view = ScoreResultBackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    
}
