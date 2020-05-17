//
//  CircleButton.swift
//  CardDeck
//
//  Created by Lam, Morris on 5/17/20.
//  Copyright © 2020 Morris Lam. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

    // MARK: Properties

    private let circleColor: UIColor
    private let disabledColor: UIColor
    private var colorObservation: NSKeyValueObservation?
    private var desiredColor: UIColor

    // MARK: Initialization

    init(circleColor: UIColor, disabledColor: UIColor) {
        self.circleColor = circleColor
        self.disabledColor = disabledColor
        self.desiredColor = circleColor

        super.init(frame: .zero)

        backgroundColor = .clear

        colorObservation = observe(\.isEnabled) { [weak self] button, newValue in
            button.desiredColor = button.isEnabled ? circleColor : disabledColor
            self?.setNeedsDisplay()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        desiredColor.setFill()
        path.fill()
    }
}
