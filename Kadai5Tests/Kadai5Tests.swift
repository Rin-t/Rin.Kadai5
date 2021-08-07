//
//  Kadai5Tests.swift
//  Kadai5Tests
//
//  Created by Rin on 2021/08/06.
//

import XCTest
@testable import Kadai5

class Kadai5Tests: XCTestCase {
    func testDivid() {
        let textField1: UITextField = {
            let textfield = UITextField()
            textfield.text = "6"
            return textfield
        }()
        let textField2: UITextField = {
            let textfield = UITextField()
            textfield.text = "0"
            return textfield
        }()

        // テストしたいところが以下のように複数ある場合はコメントアウトして
        // 1つずつ確かめるという方法で良いのでしょうか？
        do {
             let result = try Division().calculateDivision(textFields: [textField1, textField2])
            // XCTAssertEqual(result, 2)
        } catch let error as DivideError {
            switch error {
            case .devidedByZero:
                XCTAssertEqual(error, DivideError.devidedByZero)
            case .nonDividend:
                // XCTAssertEqual(error, DivideError.nonDividend)
            return
            case .nonDiviser:
                // XCTAssertEqual(error, DivideError.nonDiviser)
            return
            case .other:
                // XCTAssertEqual(error, DivideError.other)
            return
            }
        } catch {
            return
        }
    }
}
