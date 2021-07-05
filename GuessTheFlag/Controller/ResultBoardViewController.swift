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
    
    private lazy var conditionalLabel = buildConditionalLabel(with: "You are the best player!", and: UIColor.primaryColor)
    private lazy var conditionalBgView = buildConditionalBgView(with: UIColor.secondaryColor, and: UIColor.secondaryShadowColor.cgColor)
    
    private lazy var resultBgView = buildResultBackgroundView()
    
    private lazy var correctAnswersView = buildConditionalBgView(with: UIColor.primaryColor, and: UIColor.primaryShadowColor.cgColor)
    private lazy var correctAnswersLabel = buildConditionalLabel(with: "Correct Answers:", and: UIColor.secondaryColor)
    private lazy var correctAnswerValue = buildResultValueView(with: "10")
    
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
        
        view.addSubview(conditionalBgView)
        conditionalBgView.addSubview(conditionalLabel)
        
        view.addSubview(resultBgView)
        
        resultBgView.addSubview(correctAnswersView)
        correctAnswersView.addSubview(correctAnswersLabel)
        correctAnswersView.addSubview(correctAnswerValue)
        resultBgView.addSubview(saveGameButton)
        
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
            
            conditionalLabel.topAnchor.constraint(equalTo: conditionalBgView.topAnchor),
            conditionalLabel.leadingAnchor .constraint(equalTo: conditionalBgView.leadingAnchor),
            conditionalLabel.trailingAnchor.constraint(equalTo: conditionalBgView.trailingAnchor),
            conditionalLabel.bottomAnchor.constraint(equalTo: conditionalBgView.bottomAnchor),
            
            conditionalBgView.heightAnchor.constraint(equalToConstant: 50),
            conditionalBgView.topAnchor.constraint(equalTo: trophyImageView.bottomAnchor, constant: 20),
            conditionalBgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            conditionalBgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            resultBgView.topAnchor.constraint(equalTo: conditionalBgView.bottomAnchor, constant: 20),
            resultBgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultBgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resultBgView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            correctAnswersView.topAnchor.constraint(equalTo: resultBgView.topAnchor, constant: 10),
            correctAnswersView.leadingAnchor.constraint(equalTo: conditionalBgView.leadingAnchor),
            correctAnswersView.trailingAnchor.constraint(equalTo: conditionalBgView.trailingAnchor),
            
            correctAnswersLabel.centerYAnchor.constraint(equalTo: correctAnswersView.centerYAnchor),
            correctAnswersLabel.leadingAnchor.constraint(equalTo: correctAnswersView.leadingAnchor, constant: 10),
            correctAnswersLabel.trailingAnchor.constraint(equalTo: correctAnswerValue.leadingAnchor, constant: -10),
            
            correctAnswerValue.centerYAnchor.constraint(equalTo: correctAnswersView.centerYAnchor),
            correctAnswerValue.leadingAnchor.constraint(equalTo: correctAnswersLabel.trailingAnchor),
            correctAnswerValue.trailingAnchor.constraint(equalTo: correctAnswersView.trailingAnchor, constant: -10),
            
            saveGameButton.heightAnchor.constraint(equalToConstant: 50),
            saveGameButton.leadingAnchor.constraint(equalTo: conditionalBgView.leadingAnchor),
            saveGameButton.trailingAnchor.constraint(equalTo: conditionalBgView.trailingAnchor),
            saveGameButton.bottomAnchor.constraint(equalTo: resultBgView.bottomAnchor, constant: -20)
            
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
        label.font = UIFont.robotoBold(ofSize: 16)
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
    
    private func buildResultBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildConditionalBgView(with bgColor: UIColor, and shwColor: CGColor) -> UIView {
        let view = UIView()
        view.backgroundColor = bgColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = shwColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildConditionalLabel(with text: String, and color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont.robotoBold(ofSize: 24)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildResultValueView(with resultValue: String) -> UIView {
        let label = UILabel()
        label.text = resultValue
        label.textAlignment = .center
        label.textColor = UIColor.primaryColor
        label.font = UIFont.robotoBold(ofSize: 32)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 0
        view.addSubview(label)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildStackView() -> UIStackView {
        let stackview = UIStackView()
        return stackview
    }
    
    private func buildSaveButton() -> UIView {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.robotoBold(ofSize: 32)
        button.setTitleColor(UIColor.secondaryColor, for: .normal)
        button.backgroundColor = UIColor.primaryColor
        button.addTarget(self, action: #selector(saveGame), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.primaryShadowColor.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .init(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
}
