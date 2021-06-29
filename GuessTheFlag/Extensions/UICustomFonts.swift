//
//  UICustomFonts.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 27/06/21.
//

import UIKit

extension UIFont {
    class func robotoLight(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    class func robotoRegular(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    class func robotoMedium(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    class func robotoBold(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
