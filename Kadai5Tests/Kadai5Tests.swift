//
//  Kadai5Tests.swift
//  Kadai5Tests
//
//  Created by Rin on 2021/08/06.
//

import XCTest
@testable import Kadai5

class Kadai5Tests: XCTestCase {
    func testDividedZero() {
        do {
            _ = try Division().calculateDivision(dividendText: "4", divisorText: "0")
            XCTFail("例外がスローされなかった")
        } catch let error as DivideError {
            XCTAssertEqual(error, DivideError.devidedByZero)
        } catch {
            return
        }
    }

    func testNonDividend() {
        do {
            _ = try Division().calculateDivision(dividendText: "", divisorText: "0")
            XCTFail("例外がスローされなかった")
        } catch let error as DivideError {
            XCTAssertEqual(error, DivideError.nonDividend)
        } catch {
            return
        }
    }

    func testNonDivisor() {
        do {
            _ = try Division().calculateDivision(dividendText: "2", divisorText: "")
            XCTFail("例外がスローされなかった")
        } catch let error as DivideError {
            XCTAssertEqual(error, DivideError.nonDivisor)
        } catch {
            return
        }
    }

    func testDivid() {
        do {
            let resultDivision = try Division().calculateDivision(dividendText: "2", divisorText: "1")
            XCTAssertEqual(resultDivision, 2)
        } catch _ as DivideError {
            XCTFail("エラーが検知されました")
        } catch {
            return
        }
    }
}
