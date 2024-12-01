//
//  Day01.swift
//  AdventOfCode
//
//  Created by Prakash Rajendran on 2024-12-01.
//

import Testing

@testable import AdventOfCode

struct Day01Tests {
  let testData = """
3   4
4   3
2   5
1   3
3   9
3   3
"""
  
  @Test func testTotalDistance() async throws {
    let challenge = Day01(data: testData)

    #expect(challenge.part1() == 11)
    #expect(challenge.refactoredDistances() == 11)
  }
  
  @Test func testSimilarityScore() async throws {
    let challenge = Day01(data: testData)
    #expect(challenge.part2() == 31)
  }
}
