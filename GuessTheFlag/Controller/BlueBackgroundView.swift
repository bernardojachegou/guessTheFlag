//
//  BaseBackgroundView.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 05/07/21.
//

import UIKit

class BlueBackgroundView: UIView {
    
    lazy var messageLabel = buildConditionalLabel(with: "Text")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        configureBackgroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func configureBackgroundView() {
        layer.cornerRadius = 10
        backgroundColor = .secondaryColor
        layer.customEffectShadow(with: UIColor.secondaryShadowColor.cgColor)
    }
    
    private func buildConditionalLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = ScaledFont.SFrobotoBold.font(forTextStyle: .title2)
        label.textColor = .primaryColor
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
}
