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
                model.showAlert(viewController: self, message: "割る数には０を入力しないでください")
            case .nonDividend:
                model.showAlert(viewController: self, message: "割られる数を入力してください")
            case .nonDiviser:
                model.showAlert(viewController: self, message: "割る数を入力してください")
            case .other:
                model.showAlert(viewController: self, message: "予期せぬエラーが発生しました")
            }
        } catch {
            model.showAlert(viewController: self, message: "予期せぬエラーが発生しました。")
        }
    }
}
