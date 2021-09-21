//
//  ScoreResultBackgroundView.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 23/08/21.
//

import UIKit

class ScoreResultBackgroundView: UIView {
    
    private lazy var correctAnswersView = buildCorrectAnswersView()
    private lazy var wrongAnswersView = buildWrongAnswersView()
    private lazy var finalScoreView = buildFinalScoreView()
    private lazy var saveGameButton = buildSaveButton()
    lazy var userNameTextField = buildInputTextField()
    weak var delegate: ResultBoardViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        configureScoreBackgroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewValues(scoreValues: FinalScoreValues) {
        wrongAnswersView.scorePointLabel.text = scoreValues.wrongAnswers
        correctAnswersView.scorePointLabel.text = scoreValues.correctAnswers
        finalScoreView.scorePointLabel.text = scoreValues.finalScore
    }
    
    func toggleSaveButton() {
        if let text = userNameTextField.text, !text.isEmpty {
            saveGameButton.isUserInteractionEnabled = true
            saveGameButton.alpha = 1.0
        } else {
            saveGameButton.isUserInteractionEnabled = false
            saveGameButton.alpha = 0.5
        }
    }
    
    private func configureConstraints() {
        addSubview(correctAnswersView)
        addSubview(wrongAnswersView)
        addSubview(finalScoreView)
        addSubview(userNameTextField)
        addSubview(saveGameButton)
        
        NSLayoutConstraint.activate([
            correctAnswersView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            correctAnswersView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            correctAnswersView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            wrongAnswersView.topAnchor.constraint(equalTo: correctAnswersView.bottomAnchor, constant: 20),
            wrongAnswersView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wrongAnswersView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            finalScoreView.topAnchor.constraint(equalTo: wrongAnswersView.bottomAnchor, constant: 20),
            finalScoreView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            finalScoreView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            userNameTextField.topAnchor.constraint(equalTo: finalScoreView.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            saveGameButton.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            saveGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            saveGameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveGameButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor , constant: -40)
        ])
    }
    
    
    private func configureScoreBackgroundView() {
        backgroundColor = .secondaryColor
    }
    
    private func buildCorrectAnswersView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Correct answers: "
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildWrongAnswersView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Wrong answers: "
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildFinalScoreView() -> YellowBackgroundView {
        let view = YellowBackgroundView()
        view.scoreTopicLabel.text = "Final score: "
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildInputTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = "Type your hunter's name here!"
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.addPadding(padding: .equalSpacing(10))
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
        button.addTarget(self, action: #selector(saveButtonConnector(_:)), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.isUserInteractionEnabled = false
        button.alpha = 0.5
        return button
    }
    
    @objc func saveButtonConnector(_ sender: UIButton) {
        delegate?.saveGameButton(sender)
    }
}
