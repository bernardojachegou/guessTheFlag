//
//  ScoreboardTableViewCell.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 14/07/21.
//

import UIKit

class ScoreboardTableViewCell: UITableViewCell {
    
    static var identifier = "userScoreInfos"
    
    private lazy var userNameInfoBg = buildUserInfoView()
    private lazy var userScoreInfoBg = buildUserInfoView()
    public lazy var userNameLabel = buildUserInfoLabel()
    public lazy var userScoreLabel = buildUserInfoLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .primaryColor
        contentView.layer.customEffectShadow(with: UIColor.primaryShadowColor.cgColor)
        contentView.addSubview(userNameInfoBg)
        userNameInfoBg.addSubview(userNameLabel)
        contentView.addSubview(userScoreInfoBg)
        userScoreInfoBg.addSubview(userScoreLabel)
        
        NSLayoutConstraint.activate([
            userNameInfoBg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userNameInfoBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            userNameInfoBg.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            userNameInfoBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            userScoreInfoBg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userScoreInfoBg.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            userScoreInfoBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            userScoreInfoBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            userNameLabel.topAnchor.constraint(equalTo: userNameInfoBg.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userNameInfoBg.leadingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: userNameInfoBg.trailingAnchor, constant: -10),
            userNameLabel.bottomAnchor.constraint(equalTo: userNameInfoBg.bottomAnchor, constant: -10),
            
            userScoreLabel.topAnchor.constraint(equalTo: userScoreInfoBg.topAnchor, constant: 10),
            userScoreLabel.leadingAnchor.constraint(equalTo: userScoreInfoBg.leadingAnchor, constant: 10),
            userScoreLabel.trailingAnchor.constraint(equalTo: userScoreInfoBg.trailingAnchor, constant: -10),
            userScoreLabel.bottomAnchor.constraint(equalTo: userScoreInfoBg.bottomAnchor, constant: -10),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension ScoreboardTableViewCell {
    private func buildUserInfoView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 10
        view.layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildUserInfoLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .primaryColor
        label.textAlignment = .center
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }
}
