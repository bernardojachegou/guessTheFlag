//
//  YellowBackgroundView.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 11/07/21.
//

import UIKit

class YellowBackgroundView: UIView {
    
    lazy var scoreTopicLabel = buildlScoreTopicLabel()
    lazy var scorePointLabel = buildScorePointLabel()
    lazy var scorePointsView = buildScorePointsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        configureBackgroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        addSubview(scoreTopicLabel)
        addSubview(scorePointsView)
        scorePointsView.addSubview(scorePointLabel)
        
        NSLayoutConstraint.activate([
            scoreTopicLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreTopicLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            scoreTopicLabel.trailingAnchor.constraint(greaterThanOrEqualTo: scorePointsView.leadingAnchor, constant: -10),
            
            scorePointsView.widthAnchor.constraint(equalToConstant: 100),
            scorePointsView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            scorePointsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            scorePointsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            scorePointLabel.centerYAnchor.constraint(equalTo: scorePointsView.centerYAnchor),
            scorePointLabel.centerXAnchor.constraint(equalTo: scorePointsView.centerXAnchor)
        ])
        
    }
    
    private func configureBackgroundView() {
        layer.cornerRadius = 10
        backgroundColor = .primaryColor
        layer.shadowColor = UIColor.primaryShadowColor.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 0, height: 5)
        layer.shadowRadius = 0
    }
    
    private func buildlScoreTopicLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title2)
        label.textColor = .secondaryColor
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildScorePointLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .primaryColor
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildScorePointsView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.secondaryShadowColor.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
