//
//  Day02.swift
//  AdventOfCode
//
//  Created by Prakash Rajendran on 2024-12-02.
//

import Testing

@testable import AdventOfCode

struct Day02Tests {
  
  let testData = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""
  
  @Test func testSafetyReports() async throws {
    let challenge = Day02(data: testData)
    #expect(challenge.part1() == 2)
  }
  
  @Test func testDampenedSafetyReports() async throws {
    let challenge = Day02(data: testData)
    #expect(challenge.part2() == 4)
  }
}
