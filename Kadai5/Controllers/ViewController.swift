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

    private let model = Division()

    @IBAction private func didTapButton(_ sender: UIButton) {
        // do-catchの部分もModelにすべきでしょうか？
        do {
            let culculationResult = try model.calculateDivision(
                dividendText: textField1.text ?? "",
                divisorText: textField2.text ?? ""
            )

            label.text = String(culculationResult)
        } catch let error as DivideError {
            showDivisionAlert(viewController: self, message: error.message)
        } catch {
            showDivisionAlert(viewController: self, message: "予期せぬエラーが発生しました")
        }
    }

    private func showDivisionAlert(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "課題５", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true, completion: nil)
    }
}
