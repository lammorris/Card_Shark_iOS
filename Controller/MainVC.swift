//
//  ViewController.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/14/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import UIKit

protocol CardSharkDelegate {
    func shuffleDeck(_ completion: @escaping () -> Void)
    func arrangeDeck()
    func getDeckID() -> String
    func getCards() -> [Card]
}

class MainVC: UIViewController, CardSharkDelegate {

    // MARK: - Properties
    private let service = CardSharkSVC()
    private(set) var deckID: String?
    private(set) var cards: [Card]?

    // MARK: - View Properties
    private lazy var activityIndicator: UIActivityIndicatorView = {
        createSpinner()
    }()

    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = (segue.destination as! DisplayVC)
        destination.delegate = self
    }

    // MARK: - Actions
    @IBAction func startButton(_ sender: UIButton) { start() }
}

extension MainVC {

    // NOTE: Much better method is to use Dispatch Semaphores + OperationQueue to synchronize dependent network calls rather than an ugly set of nested calls.
    // This is the easy way out
    private func start() {
        controlSpinner(willSpin: true, indicator: activityIndicator)
        service.getNewDeck() { [unowned self] deck in
            self.deckID = deck.deck_id
            self.shuffleDeck { DispatchQueue.main.async { [unowned self] in self.performSegue(withIdentifier: "Display", sender: self) } }
        }
    }

    public func shuffleDeck(_ completion: @escaping () -> Void) {
        guard let id = deckID else { return }
        service.shuffleDeck(id) { [unowned self] _ in
            self.service.getCards(id) { [unowned self] cardResponse in
                self.cards = cardResponse.cards
                completion()
                DispatchQueue.main.async { [unowned self] in self.controlSpinner(willSpin: false, indicator: self.activityIndicator) }
            }
        }
    }
    public func arrangeDeck() {
        guard let unwrapCards = cards else { return }
        let diamondCards = unwrapCards.filter({ $0.suit == .DIAMONDS })
        let clubCards = unwrapCards.filter({ $0.suit == .CLUBS })
        let heartCards = unwrapCards.filter({ $0.suit == .HEARTS })
        let spadeCards = unwrapCards.filter({ $0.suit == .SPADES })

        cards = clubCards + heartCards + spadeCards + diamondCards

        // Check to print
        _ = cards?.compactMap {
            if let val = Int($0.value) { print(val) }
        }
    }
    public func getDeckID() -> String { return deckID! }
    public func getCards() -> [Card] { return cards! }
}
