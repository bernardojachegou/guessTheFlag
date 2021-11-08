//
//  RoundViewModel.swift
//  GuessTheFlag
//
//  Created by Michel Franklin Silva Bernardo on 03/11/21.
//

import Foundation

class RoundViewModel {
    private var counter: Int = 5
    private var selectedIndex: Int = 0
    
    private var roundsLeft: Int = 10 // 1 in 3
    private var totalRounds: Int = 10 // 1 in 3
    private var countRounds: Int = 0 // 1 in 3
    
    private var scoreValue: Int = 0 // in both
    private var correctAnswers: Int = 0 // in both
    private var wrongAnswers: Int = 0 // in both
    
    public func setCounter(_ seconds: Int) {
        counter = seconds
    }
    
    public func setRounds(_ amount: Int) {
        totalRounds = amount
    }
    
    public func getRounds() -> Int {
        return totalRounds
    }
    
    public func setCorrectAnswers(_ correctAnswers: Int) {
        return
    }
    
    public func getCorrectAnswers() -> Int {
        return correctAnswers
    }
    
    public func setWrongAnswers(_ wrongAnswers: Int) {
        return
    }
    
    public func getWrongAnswers() -> Int {
        return wrongAnswers
    }
    
}
