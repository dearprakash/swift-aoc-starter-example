//
//  Day02.swift
//  AdventOfCode
//
//  Created by Prakash Rajendran on 2024-12-02.
//

struct Day02: AdventDay {
  let data: String

  func part1() -> Int {
    concisePart1()
  }

  func part2() -> Int {
    concisePart2()
  }

  func dampenedGradual(_ input: [Int]) -> Bool {
    if gradual(input: input) {
      //      print("gradual as is \(input)")
      return true
    }

    for index in input.indices {
      var temp = input
      temp.remove(at: index)
      if gradual(input: temp) {
        //        print("input: \(input), gradual with one removal: \(temp)")
        return true
      }
    }

    return false
  }

  func concisePart1() -> Int {
    countValidLines(using: conciseGradual)
  }

  func concisePart2() -> Int {
    countValidLines(using: dampenedGradual(_:))
  }

  func conciseGradual(input: [Int]) -> Bool {
    guard input.count > 1 else { return false }

    let differences = input.adjacentPairs().map { $0 - $1 }
    let consistent = differences.allSatisfy { $0 > 0 } || differences.allSatisfy { $0 < 0 }

    guard consistent else { return false }

    let valid = differences.allSatisfy { abs($0) >= 1 && (abs($0) <= 3) }
    return valid
  }

  func countValidLines(using: ([Int]) -> Bool) -> Int {
    return data.split(whereSeparator: \.isNewline)
      .compactMap { line in
        line.split(whereSeparator: \.isWhitespace)
          .compactMap { Int($0) }
      }
      .filter(using)
      .count
  }

  func gradual(input: [Int]) -> Bool {
    guard input.count > 1 else { return false }

    let differences = zip(input, input.dropFirst()).map { $0 - $1 }
    let consistent = consistentlyDecreasing(differences) || consistentlyIncreasing(differences)
    guard consistent else {
      return false
    }

    let stripped = differences.filter { abs($0) >= 1 && abs($0) <= 3 }
    return differences == stripped
  }

  func consistentlyIncreasing(_ input: [Int]) -> Bool {
    input.allSatisfy { ($0 > 0) }
  }

  func consistentlyDecreasing(_ input: [Int]) -> Bool {
    input.allSatisfy { ($0 < 0) }
  }

  func naivePart1() -> Int {
    return data.components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .compactMap { line in
        line.components(separatedBy: .whitespaces)
          .compactMap(Int.init)
      }
      .filter(gradual)
      .count
  }

  func naivePart2() -> Int {
    return
      data
      .components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .compactMap { line in
        line.components(separatedBy: .whitespaces)
          .compactMap(Int.init)
      }
      .filter(dampenedGradual)
      .count
  }

  func naiveGradual(input: [Int]) -> Bool {
    var differences: [Int] = []
    var index = 0
    while index < input.count - 1 {
      let diff = input[index] - input[index + 1]
      differences.append(diff)
      index += 1
    }
    let consistent = consistentlyDecreasing(differences) || consistentlyIncreasing(differences)
    guard consistent else {
      return false
    }
    let stripped = differences.filter { abs($0) >= 1 && abs($0) <= 3 }
    return differences.count == stripped.count
  }

}
