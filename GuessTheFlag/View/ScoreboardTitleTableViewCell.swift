//
//  ScoreboardTitleTableViewCell.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 14/07/21.
//

import UIKit

class ScoreboardTitleTableViewCell: UITableViewCell {
    
    private lazy var titleNameLabel = buildTitleLabel(with: "Name")
    private lazy var titleScoreLabel = buildTitleLabel(with: "Score")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .primaryColor
        contentView.layer.customEffectShadow(with: UIColor.primaryShadowColor.cgColor)
        contentView.addSubview(titleNameLabel)
        contentView.addSubview(titleScoreLabel)
        
        NSLayoutConstraint.activate([
            titleNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            titleNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            titleScoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleScoreLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            titleScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleScoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ScoreboardTitleTableViewCell {
    private func buildTitleLabel(with title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .secondaryColor
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        return label
    }
}
