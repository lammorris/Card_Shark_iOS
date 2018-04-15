//
//  DisplayVC.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/14/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import UIKit
import SDWebImage

class DisplayVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Properties
    lazy var cards: [Card] = {
        return delegate.getCards()
    }()
    var delegate: CardSharkDelegate!

    // MARK: - View Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var activityIndicator: UIActivityIndicatorView = {
        createSpinner()
    }()

    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = delegate.getDeckID()
        collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return cards.count }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! CardCell
        let card = cards[indexPath.row]
        cell.cardImage.sd_setImage(with: URL(string: card.image)!, completed: nil)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3.0
        let height = width

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // MARK: - Navigation
    // MARK: - Actions
    @IBAction func arrangeButton(_ sender: UIButton) {
        delegate.arrangeDeck()
        performSelector(onMainThread: #selector(self.reloadCards), with: nil, waitUntilDone: true)
    }
    @IBAction func shuffleButton(_ sender: UIButton) {
        activityIndicator.startAnimating()
        delegate.shuffleDeck() { [unowned self] in
            self.performSelector(onMainThread: #selector(self.reloadCards), with: nil, waitUntilDone: true)
        }
    }
}

extension DisplayVC {
    @objc private func reloadCards() {
        cards = delegate.getCards()
        collectionView.reloadData()
        DispatchQueue.main.async { [unowned self] in self.activityIndicator.stopAnimating() }
    }
}
