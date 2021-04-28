//
//  Round.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 26/04/21.
//

import Foundation

struct RoundList: Decodable {
  var roundList: [Round]
}

struct FlagAnswerOptions: Decodable {
  var flagFirstOption: String
  var flagSecondOption: String
}

struct Round: Decodable {
  var flagImageName: String
  var flagAnswerOptions: [FlagAnswerOptions]
  var flagCorrectOption: String
}

func loadJsonFile(fileName: String) -> RoundList? {
  
  if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let jsonData = try decoder.decode(RoundList.self, from: data)
      return jsonData
    } catch {
      print("error:\(error)")
    }
  }
  return nil
}
