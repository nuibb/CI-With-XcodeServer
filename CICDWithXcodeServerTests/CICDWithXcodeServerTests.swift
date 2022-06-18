//
//  CICDWithXcodeServerTests.swift
//  CICDWithXcodeServerTests
//
//  Created by ReliSource Technologies Ltd. on 6/18/22.
//

import XCTest
@testable import CICDWithXcodeServer

class CICDWithXcodeServerTests: XCTestCase {
    var fruits: [Fruit] = []
    
    override func setUpWithError() throws {
        fruits = loadJson(filename: "mock")
    }
    
    func testDecodingJSONCorrectly() throws {
        XCTAssertNotNil(fruits)
    }
    
    func testFruitsContainsBanana() throws {
        XCTAssert(fruits.contains { $0.name == "Banana 🍌" })
    }
}

extension CICDWithXcodeServerTests {
    private func loadJson(filename fileName: String) -> [Fruit] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Fruit].self, from: data)
                return jsonData
            } catch {
                print("Error getting JSON:\(error)")
            }
        }
        return []
    }
}
