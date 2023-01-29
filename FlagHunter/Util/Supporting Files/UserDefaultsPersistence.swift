//
//  UserDefaultsPersistence.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 30/07/21.
//

import Foundation

class UserDefaultsPersistence {

    static var storefrontCountryCode: String {
        get {
            return UserDefaults.standard.string(forKey: "storefrontCountryCode") ?? "us"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "storefrontCountryCode")
        }
    }

}
