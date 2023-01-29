//
//  UICustomShadow.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 14/07/21.
//

import UIKit

extension CALayer {
    func customEffectShadow(with color: CGColor) {
        shadowColor = color
        shadowOpacity = 1
        shadowOffset = .init(width: 0, height: 5)
        shadowRadius = 0
    }
    func progressShadow() {
        shadowColor = UIColor.black.cgColor
        shadowOffset = .init(width: 0, height: 3)
        shadowOpacity = 0.3
        shadowRadius = 3
    }
}
