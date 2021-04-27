//
//  Round.swift
//  GuessTheFlag
//
//  Created by Michel Bernardo on 26/04/21.
//

import Foundation

struct RoundList: Decodable {
  var round: [Round]
}

struct Round: Decodable {
  var flagImageName: String
  var flagAnswerOptions: [FlagAnswerOptions]
  var flagCorrectOption: String
}

struct FlagAnswerOptions: Decodable {
  var flagFirstOption: String
  var flagSecondOption: String
}

func readLocalJson(fileName: String) -> RoundList? {
  
  let decoder = JSONDecoder()
  
  guard
    let bundlePath = Bundle.main.url(forResource: fileName, withExtension: "json"),
    let data = try? Data(contentsOf: bundlePath),
    let decodedData = try? decoder.decode(RoundList.self, from: data)
  else {
    return nil
  }
  print(decodedData)
  return decodedData
}

func loadJson(fileName: String) -> RoundList? {
  if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
      if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["round"] as? [Any] {
        print(jsonResult)
      }
    } catch {
      // handle error
    }
  }
  return nil
}



//func parse(jsonData: Data) {
//  do {
//    let decodedData = try JSONDecoder().decode(Round.self, from: jsonData)
//    print(decodedData.flagImageName)
//    print("===================================")
//  } catch {
//    print("decode error")
//  }
//}
