//
//  PlayerCell.swift
//  CardDeck
//
//  Created by Morris Lam on 9/2/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import SDWebImage
import UIKit

final class PlayerCell: UICollectionViewCell {

    private struct Layout {
        static let margin: CGFloat = 20.0
    }

    // MARK: - Properties

    private let currentCardImage = UIImageView()
    private let playerNameLabel: UILabel
    private let remainingCardLabel: UILabel

    // MARK: - Initialization

    override init(frame: CGRect) {
        playerNameLabel = {
            let view = UILabel()
            view.textColor = .black
            view.textAlignment = .center

            return view
        }()

        remainingCardLabel = {
            let view = UILabel()
            view.textColor = .black
            view.textAlignment = .center

            return view
        }()

        super.init(frame: frame)

        backgroundColor = .lightGray

        addSubview(currentCardImage)
        addSubview(playerNameLabel)
        addSubview(remainingCardLabel)

        currentCardImage.translatesAutoresizingMaskIntoConstraints = false
        playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingCardLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            currentCardImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.margin),
            currentCardImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.margin),
            currentCardImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Layout.margin),
            playerNameLabel.topAnchor.constraint(equalTo: currentCardImage.bottomAnchor, constant: Layout.margin),
            playerNameLabel.leadingAnchor.constraint(equalTo: currentCardImage.leadingAnchor),
            playerNameLabel.trailingAnchor.constraint(equalTo: currentCardImage.trailingAnchor),
            remainingCardLabel.topAnchor.constraint(equalTo: playerNameLabel.bottomAnchor),
            remainingCardLabel.leadingAnchor.constraint(equalTo: currentCardImage.leadingAnchor),
            remainingCardLabel.trailingAnchor.constraint(equalTo: currentCardImage.trailingAnchor),
            remainingCardLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func updateConstraints() {
        super.updateConstraints()
    }

    // MARK: - Methods

    override func prepareForReuse() {
        currentCardImage.image = nil
        playerNameLabel.text = nil
        remainingCardLabel.text = nil
    }

    func update(playerInfo: Player) {
        currentCardImage.sd_setImage(with: nil, placeholderImage: nil)
        playerNameLabel.text = playerInfo.name
        remainingCardLabel.text = String(playerInfo.cardsRemaining)
    }
}
