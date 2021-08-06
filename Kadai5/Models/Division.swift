//
//  Model.swift
//  Kadai5
//
//  Created by Rin on 2021/08/07.
//

import UIKit

enum DivideError: Error {
    case devidedByZero
    case nonDiviser
    case nonDividend
    case other
}

final class Division {
    func divide(textFields: [UITextField]) throws -> Double {
        let nums = textFields.map { Double($0.text ?? "") }

        if nums[0] == nil {
            throw DivideError.nonDividend
        } else if nums[1] == nil {
            throw DivideError.nonDiviser
        } else if nums[1] == 0 {
            throw DivideError.devidedByZero
        }
        // mapでDouble以外の値が入っている場合はif文で検知されているはずなので
        // 強制アンラップをしてDivideError.otherを無くした方がいいのでしょうか？
        guard let dividend = nums[0],
              let divisor = nums [1] else { throw DivideError.other }
        return dividend / divisor
    }

    func showAlert(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "課題５", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true, completion: nil)
    }
}
