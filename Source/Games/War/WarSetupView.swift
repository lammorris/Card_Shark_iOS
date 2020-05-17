//
//  WarSetupView.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol WarSetupViewDelegate: AnyObject {
    func warSetupView(_ view: WarSetupView, didUpdatePlayerCount count: Int)
}

final class WarSetupView: BaseView {
    private struct Layout {
        static let containerSpacing: CGFloat = 8.0
        static let margin: CGFloat = 20
        static let animationTiming: TimeInterval = TimeInterval(exactly: 0.5)!
        static let buttonSize: CGFloat = 72
    }

    // MARK: - Properties

    weak var delegate: (UITextFieldDelegate & WarSetupViewDelegate)?

    let startButton: UIButton
    var selectedNumberOfPlayers: Int {
        return playersFieldSelector.selectedValue
    }

    private let rangeOfPlayers: [Int]
    private let playersSelectionContainer: UIStackView
    private let playersLabel: UILabel
    private let playersFieldSelector: NumberPickerTextField
    private let playerNamesContainerView: UIStackView
    private let buttonContainer: UIStackView

    private var bottomConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    init(rangeOfPlayers: [Int]) {
        self.rangeOfPlayers = rangeOfPlayers

        playersSelectionContainer = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .equalSpacing

            return view
        }()

        playersLabel = {
            let view = UILabel()
            view.text = "Number of players"
            view.alpha = 0

            return view
        }()

        playersFieldSelector = NumberPickerTextField(placeholderText: "Number of players", values: rangeOfPlayers)

        playerNamesContainerView = {
            let view = UIStackView()
            view.axis = .vertical
            view.spacing = Layout.containerSpacing
            view.distribution = .equalSpacing

            return view
        }()

        buttonContainer = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .equalSpacing

            return stack
        }()

        startButton = {
            let view = CircleButton(circleColor: .systemBlue, disabledColor: .systemRed)
            view.isEnabled = false
            view.setTitle("Start", for: .normal)
            view.setTitleColor(.white, for: .normal)

            return view
        }()

        super.init(frame: .zero)

        playersFieldSelector.numberPickerDelegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func constructSubviewHierarchy() {
        super.constructSubviewHierarchy()

        playersSelectionContainer.addArrangedSubview(playersLabel)
        playersSelectionContainer.addArrangedSubview(playersFieldSelector)
        buttonContainer.addArrangedSubview(startButton)

        addSubview(playersSelectionContainer)
        addSubview(playerNamesContainerView)
        addSubview(buttonContainer)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        playersSelectionContainer.translatesAutoresizingMaskIntoConstraints = false
        playerNamesContainerView.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false

        bottomConstraint = buttonContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([
            playersSelectionContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.margin),
            playersSelectionContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.margin),
            playersSelectionContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Layout.margin),

            playerNamesContainerView.topAnchor.constraint(equalTo: playersSelectionContainer.bottomAnchor, constant: Layout.margin),
            playerNamesContainerView.leadingAnchor.constraint(equalTo: playersSelectionContainer.leadingAnchor),
            playerNamesContainerView.trailingAnchor.constraint(equalTo: playersSelectionContainer.trailingAnchor),

            buttonContainer.topAnchor.constraint(greaterThanOrEqualTo: playerNamesContainerView.bottomAnchor, constant: Layout.containerSpacing),
            buttonContainer.leadingAnchor.constraint(lessThanOrEqualTo: playersSelectionContainer.leadingAnchor),
            buttonContainer.trailingAnchor.constraint(lessThanOrEqualTo: playersSelectionContainer.trailingAnchor),
            bottomConstraint!,
            buttonContainer.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            startButton.heightAnchor.constraint(equalToConstant: Layout.buttonSize),
            startButton.widthAnchor.constraint(equalTo: startButton.heightAnchor)
        ])
    }

    // MARK: - Methods

    func update(playersCount: Int) {
        playersFieldSelector.text = String(playersCount)
        animateShowPlayerLabels(numberOfPlayers: playersCount)
    }

    @objc func resignAllResponders() {
        playersFieldSelector.resignFirstResponder()
        playerNamesContainerView.arrangedSubviews.forEach { labeledTextField in
            labeledTextField.subviews.forEach({ $0.resignFirstResponder() })
        }
    }

    @objc func keyboardFrameDidChange(notification: NSNotification) {
        guard
            let info = notification.userInfo,
            let animationDuration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        else { return }

        if
            notification.name == UIResponder.keyboardWillShowNotification,
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height,
            bottomConstraint?.constant == 0
        {
            self.bottomConstraint?.constant = -keyboardHeight
            UIView.animate(withDuration: animationDuration) {
                self.layoutIfNeeded()
            }
        } else if notification.name == UIResponder.keyboardWillHideNotification {
            self.bottomConstraint?.constant = 0
            UIView.animate(withDuration: animationDuration) {
                self.layoutIfNeeded()
            }
        }
    }

    // MARK: - Private Methods

    private func animateShowPlayerLabels(numberOfPlayers: Int) {
        playerNamesContainerView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for number in 1...numberOfPlayers {
            playerNamesContainerView.addArrangedSubview(self.createLabeledTextField(playerNumber: number))
        }

        playerNamesContainerView.alpha = 0

        UIView.animate(withDuration: Layout.animationTiming) {
            if self.playersLabel.alpha.isZero {
                self.playersLabel.alpha = 1
            }

            self.playerNamesContainerView.alpha = 1
        }
    }

    private func createLabeledTextField(playerNumber: Int) -> UIStackView {
        let label = UILabel()
        label.text = "Player \(playerNumber)"

        let textField = UITextField()
        textField.placeholder = "Name"
        textField.delegate = delegate
        textField.autocorrectionType = .no

        let view = UIStackView(arrangedSubviews: [label, textField])
        view.axis = .vertical
        view.distribution = .equalSpacing

        return view
    }
}

extension WarSetupView: NumberPickerTextFieldDelegate {
    func numberPickerTextField(_ textField: NumberPickerTextField, didUpdate number: Int) {
        animateShowPlayerLabels(numberOfPlayers: number)
        delegate?.warSetupView(self, didUpdatePlayerCount: number)
    }

    func numberPickerTextFieldDidComplete(_ textField: NumberPickerTextField) {
        textField.resignFirstResponder()
    }
}
