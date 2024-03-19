@testable import DiffMatchPatch
import XCTest

final class DiffMatchPatchTests: XCTestCase {
    func testThreeWayMerge() throws {
        let old = """
        Buy:

        * Milk
        * Fresh bread
        * Eggs (6)
        """.trimmingCharacters(in: .whitespacesAndNewlines)

        let new = """
        To buy:

        * Milk
        * Fresh bread (x2)
        * Eggs (6)
        """.trimmingCharacters(in: .whitespacesAndNewlines)

        let base = """
        Buy:

        * Milk
        * Fresh bread
        * Eggs (10)
        """.trimmingCharacters(in: .whitespacesAndNewlines)

        let expected = """
        To buy:

        * Milk
        * Fresh bread (x2)
        * Eggs (10)
        """.trimmingCharacters(in: .whitespacesAndNewlines)

        let merged = try threeWayMerge(old: old, new: new, base: base)
        XCTAssertEqual(merged, expected)
    }
}
