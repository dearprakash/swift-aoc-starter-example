//
//  Day03.swift
//  AdventOfCode
//
//  Created by Prakash Rajendran on 2024-12-02.
//

import Testing

@testable import AdventOfCode

struct Day03Tests {
  
  let testData = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
  let testDataWithCondition = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

  @Test func testFirst() async throws {
    let challenge = Day03(data: testData)
    #expect(challenge.part1() == 161)
  }
  
  @Test func testSecond() async throws {
    let challenge = Day03(data: testDataWithCondition)
    #expect(challenge.part2() == 48)
  }
  
}
