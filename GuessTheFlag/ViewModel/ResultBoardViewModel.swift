//
//  ResultBoardViewModel.swift
//  GuessTheFlag
//
//  Created by Michel Franklin Silva Bernardo on 26/10/21.
//

import Foundation

enum ResultMessage: String {
    case best = "You are the best!"
    case good = "You are good!"
    case bad = "You must practice!"
}

class ResultBoardViewModel {
    private var scoreValue: Int = 0 // in both
    private var correctAnswers: Int = 0 // in both
    private var wrongAnswers: Int = 0 // in both
    
    private var maxLength: Int = 0
    private var finalscore: Int = 0
    
    public func setMaxLength(_ length: Int) {
        maxLength = length
    }
    
    public func setScore(_ value: Int) {
        let multiplier: Int = 30
        scoreValue = value < 0 ? 0 : value * multiplier
    }
    
    public func getScore() -> Int {
        return scoreValue
    }
    
    public func getFinalMessage() -> ResultMessage {
        if scoreValue >= 8 {
            return .best
        } else if scoreValue > 5 {
            return .good
        } else {
            return .bad
        }
    }
}
