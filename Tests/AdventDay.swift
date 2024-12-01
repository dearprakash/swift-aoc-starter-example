import Testing

@testable import AdventOfCode

// One off test to validate that basic data load testing works
struct AdventDayTests {

  @Test func testInitData() async throws {
    let challenge = Day00()
    #expect(challenge.data.starts(with: "4514"))
  }
  
  @Test func testFirstDayData() async throws {
    let challenge = Day01()
    #expect(challenge.data.starts(with: "76569   66648"))
  }
  
  @Test func testFirstDayTotalDistance() async throws {
    let challenge = Day01()
    #expect(challenge.part1() == 3246517)
  }
  
  @Test func testFirstDayTotalSimilarity() async throws {
    let challenge = Day01()
    #expect(challenge.part2() == 29379307)
  }

}
