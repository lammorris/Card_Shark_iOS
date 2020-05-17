//
//  WarSetupViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol WarSetupViewControllerDelegate: AnyObject {
    func warSetupViewController(_ viewController: WarSetupViewController, didComplete playerNames: [String])
}

final class WarSetupViewController: BaseViewController<WarSetupView> {

    // MARK: - Properties

    weak var delegate: WarSetupViewControllerDelegate?

    private var players: [Int: String] = [:]

    // MARK: - Initialization

    init(rangeOfPlayers: [Int]) {
        super.init { WarSetupView(rangeOfPlayers: rangeOfPlayers) }

        rootView.delegate = self
        rootView.startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        if let defaultPlayers = rangeOfPlayers.first {
            rootView.update(playersCount: defaultPlayers)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "War"
        navigationItem.largeTitleDisplayMode = .automatic

        addGestures()
    }

    // MARK: - Private Methods

    @objc private func didTapStart() {
        resignResponders()
        delegate?.warSetupViewController(self, didComplete: Array(players.values))
    }

    @objc private func resignResponders() {
        rootView.resignAllResponders()
    }

    private func addGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignResponders))
        rootView.addGestureRecognizer(tapGesture)
    }
}

extension WarSetupViewController: WarSetupViewDelegate {
    func warSetupView(_ view: WarSetupView, didUpdatePlayerCount count: Int) {
        players.removeAll()
    }
}

extension WarSetupViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let name = textField.text, name.isEmpty == false else {
            rootView.startButton.isEnabled = false
            players.removeValue(forKey: textField.hashValue)
            return
        }

        players[textField.hashValue] = name
        rootView.startButton.isEnabled = players.count == rootView.selectedNumberOfPlayers
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
