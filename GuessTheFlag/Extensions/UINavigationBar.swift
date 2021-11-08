//
//  UINavigationBar.swift
//  GuessTheFlag
//
//  Created by Michel Franklin Silva Bernardo on 04/11/21.
//

import UIKit

extension UINavigationBar {
    
    func update(backgroundColor: UIColor? = nil, shadowColor: UIColor? = nil) {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            if let backgroundColor = backgroundColor {
                appearance.backgroundColor = backgroundColor
            }
            if let shadowColor = shadowColor {
                appearance.shadowColor = shadowColor
            }
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
        } else {
            isTranslucent = false
            if let backroundColor = backgroundColor {
                standardAppearance.backgroundColor = backroundColor
            }
            if let shadowColor = shadowColor {
                standardAppearance.shadowColor = shadowColor
            }
        }
    }
}
