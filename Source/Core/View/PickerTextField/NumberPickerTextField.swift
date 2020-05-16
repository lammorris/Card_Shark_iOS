//
//  NumberPickerTextField.swift
//  CardDeck
//
//  Created by Morris Lam on 9/1/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol NumberPickerTextFieldDelegate: AnyObject {
    func numberPickerTextField(_ textField: NumberPickerTextField, didUpdate number: Int)
    func numberPickerTextFieldDidComplete(_ textField: NumberPickerTextField)
}

final class NumberPickerTextField: UITextField {

    // MARK: - Properties

    weak var numberPickerDelegate: NumberPickerTextFieldDelegate?

    var selectedValue: Int {
        guard let textValue = text, let intValue = Int(textValue) else { return 0 }
        return intValue
    }

    private let values: [Int]
    private let pickerField = UIPickerView()

    // MARK: - Initialization

    init(
        placeholderText: String? = nil,
        values: [Int])
    {
        self.values = values

        super.init(frame: .zero)

        let toolBar: UIToolbar = {
            let view = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
            view.setItems([flexButton, button], animated: true)
            view.sizeToFit()

            return view
        }()

        placeholder = placeholderText
        inputView = pickerField
        inputAccessoryView = toolBar

        pickerField.delegate = self
        pickerField.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    @objc private func doneTapped() {
        numberPickerDelegate?.numberPickerTextFieldDidComplete(self)
    }
}

extension NumberPickerTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return values.count }
}

extension NumberPickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(values[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = String(values[row])
        numberPickerDelegate?.numberPickerTextField(self, didUpdate: values[row])
    }
}
