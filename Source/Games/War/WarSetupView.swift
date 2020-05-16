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

        startButton = {
            let view = UIButton()
            view.isEnabled = false
            view.setTitle("Start", for: .normal)
            view.setTitleColor(view.tintColor, for: .normal)
            view.setTitleColor(.systemRed, for: .disabled)

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

        addSubview(playersSelectionContainer)
        addSubview(playerNamesContainerView)
        addSubview(startButton)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        playersSelectionContainer.translatesAutoresizingMaskIntoConstraints = false
        playerNamesContainerView.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            playersSelectionContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.margin),
            playersSelectionContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.margin),
            playersSelectionContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Layout.margin),
            playerNamesContainerView.topAnchor.constraint(equalTo: playersSelectionContainer.bottomAnchor, constant: Layout.margin),
            playerNamesContainerView.leadingAnchor.constraint(equalTo: playersSelectionContainer.leadingAnchor),
            playerNamesContainerView.trailingAnchor.constraint(equalTo: playersSelectionContainer.trailingAnchor),
            startButton.topAnchor.constraint(greaterThanOrEqualTo: playerNamesContainerView.bottomAnchor),
            startButton.leadingAnchor.constraint(equalTo: playersSelectionContainer.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: playersSelectionContainer.trailingAnchor),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // MARK: - Methods

    func update(playersCount: Int) {
        playersFieldSelector.text = String(playersCount)
        animateShowPlayerLabels(numberOfPlayers: playersCount)
    }

    func resignAllResponders() {
        playerNamesContainerView.arrangedSubviews.forEach { labeledTextField in
            labeledTextField.subviews.forEach({ $0.resignFirstResponder() })
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
