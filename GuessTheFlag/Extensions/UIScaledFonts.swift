//
//  ScaledFonts.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 29/06/21.
//

import UIKit

public final class ScaledFont {
    private struct FontDescription: Decodable {
        let fontSize: CGFloat
        let fontName: String
    }
    
    private typealias StyleDictionary = [UIFont.TextStyle.RawValue: FontDescription]
    private var styleDictionary: StyleDictionary?
    
    public static let SFrobotoLight = ScaledFont(fontName: "Roboto-Light")
    public static let SFrobotoRegular = ScaledFont(fontName: "Roboto-Regular")
    public static let SFrobotoMedium = ScaledFont(fontName: "Roboto-Medium")
    public static let SFrobotoBold = ScaledFont(fontName: "Roboto-Bold")
    public static let SFrobotoItalic = ScaledFont(fontName: "Roboto-Italic")
    
    public init(fontName: String) {
        if let url = Bundle.main.url(forResource: fontName, withExtension: "plist"),
           let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            styleDictionary = try? decoder.decode(StyleDictionary.self, from: data)
        }
    }
    
    public func font(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        guard let fontDescription = styleDictionary?[textStyle.rawValue],
              let font = UIFont(name: fontDescription.fontName, size: fontDescription.fontSize) else {
            return UIFont.preferredFont(forTextStyle: textStyle)
        }
        
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: font)
    }
    
    public static func font(name: String, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: name, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
}
