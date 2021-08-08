//
//  Kadai5Tests.swift
//  Kadai5Tests
//
//  Created by Rin on 2021/08/06.
//

import XCTest
@testable import Kadai5

class Kadai5Tests: XCTestCase {
    func testDevidedByZero() {
        do {
            _ = try Division().calculateDivision(dividendText: "6", divisorText: "0")
            XCTFail("例外がスローされなかった")
        } catch let error as DivideError {
            XCTAssertEqual(error, DivideError.devidedByZero)
        } catch {
            XCTFail("期待するエラーが発生しなかった")
        }
    }

    func testSuccess() {
        do {
            let result = try Division().calculateDivision(dividendText: "6", divisorText: "2")
            XCTAssertEqual(result, 3)
        } catch {
            XCTFail("エラーが発生してしまった")
        }
    }
}
