//
//  Model.swift
//  Kadai5
//
//  Created by Rin on 2021/08/07.
//

import Foundation

enum DivideError: Error {
    case devidedByZero
    case nonDivisor
    case nonDividend

    var message: String {
        switch self {
        case .devidedByZero: return "割る数には０を入力しないでください"
        case .nonDivisor: return "割る数を入力してください"
        case .nonDividend: return "割られる数を入力してください"
        }
    }
}

final class Division {
    func calculateDivision(dividendText: String, divisorText: String) throws -> Double {
        guard let dividend = Double(dividendText) else {
            throw DivideError.nonDividend
        }

        guard let divisor = Double(divisorText) else {
            throw DivideError.nonDivisor
        }

        guard  divisor != 0 else {
            throw DivideError.devidedByZero
        }

        return dividend / divisor
    }
}
