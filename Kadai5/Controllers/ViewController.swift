//
//  ViewController.swift
//  Kadai5
//
//  Created by Rin on 2021/08/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var label: UILabel!

    private var textFields: [UITextField] { [ textField1, textField2 ] }

    private let model = Division()

    @IBAction private func didTapButton(_ sender: UIButton) {
        // do-catchの部分もModelにすべきでしょうか？
        do {
            let culculationResult = try model.divide(textFields: textFields)
            label.text = String(culculationResult)
        } catch let error as DivideError {
            switch error {
            case .devidedByZero:
                model.showAlert(viewController: self, message: error.alertTirle)
            case .nonDividend:
                model.showAlert(viewController: self, message: error.alertTirle)
            case .nonDiviser:
                model.showAlert(viewController: self, message: error.alertTirle)
            case .other:
                model.showAlert(viewController: self, message: error.alertTirle)
            }
        } catch {
            model.showAlert(viewController: self, message: DivideError.other.alertTirle)
        }
    }
}
