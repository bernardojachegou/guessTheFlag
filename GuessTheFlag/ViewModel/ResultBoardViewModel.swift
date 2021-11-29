//
//  ResultBoardViewModel.swift
//  GuessTheFlag
//
//  Created by Michel Franklin Silva Bernardo on 26/10/21.
//

import Foundation
import UIKit

enum ResultMessage: String {
    case best = "You are the best!"
    case good = "You are good!"
    case bad = "You must practice!"
}

class ResultBoardViewModel {
    
    private var finalScoreValues: FinalScoreValues
    
    init(finalScoreValues: FinalScoreValues) {
        self.finalScoreValues = finalScoreValues
    }
    
    public func getFinalScoreValues() -> FinalScoreValues {
        return finalScoreValues
    }
    
    public func getCorrectAnswers() -> String {
        return String(finalScoreValues.correctAnswers)
    }
    
    public func getWrongAnswers() -> String {
        return String(finalScoreValues.wrongAnswers)
    }
    
    public func setScore(_ value: Int) {
        let multiplier: Int = 30
        finalScoreValues.scoreValue = value < 0 ? 0 : value * multiplier
    }
    
    public func getScore() -> String {
        return String(finalScoreValues.scoreValue)
    }
    
    public func getFinalMessage() -> ResultMessage {
        if finalScoreValues.scoreValue >= 240 {
            return .best
        } else if finalScoreValues.scoreValue > 150 {
            return .good
        } else {
            return .bad
        }
    }
    
    public func getViewHeight(_ view: UIView) -> CGFloat {
        return view.bounds.height
    }
    
    public func setTrophyImageSize(_ view: UIView) -> Int {
        view.bounds.height >= 750 ? 125 : 75
    }
}
