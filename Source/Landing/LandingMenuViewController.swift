//
//  LandingMenuViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 7/28/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class LandingMenuViewController: UITableViewController {

    // MARK: - Properties

    private let reuseIdentifier = "MenuOptionCell"
    private let tableData = [
        [
            LandingMenuModel(title: "Onboarding")
        ],
        [
            LandingMenuModel(title: "War")
        ]
    ]

    // MARK: - Methods

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Onboarding"
        case 1:
            return "Games"
        default:
            assertionFailure("Section header has not been implemented.")
            return "Header"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.textLabel?.text = tableData[indexPath.section][indexPath.row].title
        cell.detailTextLabel?.text = tableData[indexPath.section][indexPath.row].detailText
        cell.selectionStyle = .none

        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Find good way to deconstruct tableData
    }
}
