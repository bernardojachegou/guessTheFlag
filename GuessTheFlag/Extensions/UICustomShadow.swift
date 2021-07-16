//
//  UICustomShadow.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 14/07/21.
//

import UIKit

extension  CALayer {
    func customShadow(with color: CGColor) {
        shadowColor = color
        shadowOpacity = 1
        shadowOffset = .init(width: 0, height: 5)
        shadowRadius = 0
    }
}
