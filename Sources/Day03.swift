//
//  Day03.swift
//  AdventOfCode
//
//  Created by Prakash Rajendran on 2024-12-02.
//
import RegexBuilder

struct Day03: AdventDay {
  let data: String

  nonisolated(unsafe)
  let skipString = Regex {
    "don't()"
    TryCapture {
      ZeroOrMore(.any, .reluctant)
    } transform: { match in
      String(match)
    }
    "do()"
  }

  init(data: String) {
    self.data = data
  }
  
  private func multiplicationResults(for inputString: String) -> Int {
    let firstDigit = Reference(Int.self)
    let secondDigit = Reference(Int.self)

    let searchString = Regex {
      "mul("
      TryCapture(as: firstDigit) {
        OneOrMore(.digit)
      } transform: { match in
        Int(match)
      }
      ","
      TryCapture(as: secondDigit) {
        OneOrMore(.digit)
      } transform: { match in
        Int(match)
      }
      ")"
    }
    
    var totalResult = 0
    let results = inputString.matches(of: searchString)
    for result in results {
      totalResult += result[firstDigit] * result[secondDigit]
    }

    return totalResult
  }

  private func strippedText(for inputString: String) -> String {
    var copy = inputString
    while let match = copy.firstMatch(of: skipString) {
      copy.replaceSubrange(match.range, with: "")
    }

    let resultsToSkip = copy.matches(of: skipString)
    for result in resultsToSkip {
      copy.replaceSubrange(result.range, with: "")
    }
    
    return copy
  }
  
  func part1() -> Int {
    multiplicationResults(for: data)
  }

  func part2() -> Int {
    let stripped = strippedText(for: data)
    return multiplicationResults(for: stripped)
  }
}
