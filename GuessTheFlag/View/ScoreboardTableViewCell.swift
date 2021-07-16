//
//  ScoreboardTableViewCell.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 14/07/21.
//

import UIKit

class ScoreboardTableViewCell: UITableViewCell {
    
    static var identifier = "userScoreInfos"
    
    private lazy var userNameInfoBg = buildUserInfoView(with: "Michel Bernardo")
    private lazy var userScoreInfoBg = buildUserInfoView(with: "100")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.primaryColor
        contentView.layer.customShadow(with: UIColor.primaryShadowColor.cgColor)
        contentView.addSubview(userNameInfoBg)
        contentView.addSubview(userScoreInfoBg)
        
        NSLayoutConstraint.activate([
            
            userNameInfoBg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userNameInfoBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            userNameInfoBg.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            userNameInfoBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            userScoreInfoBg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userScoreInfoBg.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            userScoreInfoBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            userScoreInfoBg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension ScoreboardTableViewCell {
    private func buildUserInfoView(with userInfo: String) -> UIView {
        let label = UILabel()
        label.text = userInfo
        label.textColor = UIColor.primaryColor
        label.textAlignment = .center
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView()
        view.backgroundColor = UIColor.secondaryColor
        view.layer.cornerRadius = 10
        view.layer.customShadow(with: UIColor.secondaryShadowColor.cgColor)
        view.addSubview(label)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
        return view
    }
    
}
