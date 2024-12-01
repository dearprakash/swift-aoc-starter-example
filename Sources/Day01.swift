//
//  Day01.swift
//  AdventOfCode
//
//  Created by Prakash Rajendran on 2024-12-01.
//
import Foundation

struct Day01: AdventDay {

  var data: String
  
  init(data: String) {
    self.data = data
  }
  
  private func pairs() -> [(Int, Int)] {
    return data
      .components(separatedBy: .newlines)
      .compactMap { line -> (Int, Int)? in
        let components = line
          .components(separatedBy: .whitespaces)
          .filter{ !$0.isEmpty }
        guard components.count == 2 else { return nil }
        guard let first = Int(components[0]),
              let second = Int(components[1]) else { return nil }
        return (first, second)
      }
  }
  
  func part1() -> Int {
    var distances: [Int] = []

    let parsedData = pairs()
    // Separate into two sorted arrays
    let firstset = parsedData.map { $0.0 }.sorted()
    let secondset = parsedData.map { $0.1 }.sorted()

    var index: Int = 0
    while (index < firstset.count) {
      distances.append(abs(firstset[index] - secondset[index]))
      index += 1
    }
    
    return distances.reduce(0, +)
  }
  
  func part2() -> Int {
    let parsedData = pairs()
    
    let first = parsedData.map { $0.0 }.sorted()
    let second = parsedData.map { $0.1 }.sorted()
    
    let scores = first.map { item in
      let filtered = second.filter { item == $0 }
      print(filtered)
      return item * filtered.count
    }
    
    let totalScore = scores.reduce(0, +)
    
    return totalScore
  }

  
  func refactoredDistances() -> Int {
        var distances: [Int] = []

        // Parse the data into tuples of integers
        let parsedData = data
            .components(separatedBy: .newlines)
            .compactMap { line -> (Int, Int)? in
                let components = line
                    .components(separatedBy: .whitespaces)
                    .filter { !$0.isEmpty }
                guard components.count == 2,
                      let first = Int(components[0]),
                      let second = Int(components[1]) else {
                    return nil
                }
                return (first, second)
            }

        // Separate into two sorted arrays
        let first = parsedData.map { $0.0 }.sorted()
        let second = parsedData.map { $0.1 }.sorted()

        // Ensure matching number of entries
        guard first.count == second.count else {
            print("Mismatched number of entries")
            return 0
        }

        // Compute distances
        distances = zip(first, second).map { abs($0 - $1) }

        print("First: \(first)")
        print("Second: \(second)")
        print("Distances: \(distances)")

        // Calculate total distance
        let total = distances.reduce(0, +)
        return total
  }
  
}
