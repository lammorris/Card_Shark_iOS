//
//  CardSharkSVC.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/14/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import Foundation

class CardSharkSVC {

    // MARK: - Properties
    private let rootURL = "https://deckofcardsapi.com/api/deck"
    private lazy var session: URLSession = URLSession(configuration: .default)
    private lazy var decoder = JSONDecoder()

    // MARK: - Methods
    public func getNewDeck(_ completion: @escaping (Response) -> Void) {
        let url = URL(string: rootURL + "/new/")!
        let task = session.dataTask(with: url) { [unowned self] (data, response, error) in
            guard error == nil else { return }
            guard let content = data else { return }
            guard let dataRsp = try? self.decoder.decode(Response.self, from: content) else { return }
            completion(dataRsp)
        }

        task.resume()
    }

    public func shuffleDeck(_ deckID: String, completion: @escaping (Response) -> Void) {
        let url = URL(string: rootURL + "/\(deckID)/shuffle/")!
        let task = session.dataTask(with: url) { [unowned self] (data, response, error) in
            guard error == nil else { return }
            guard let content = data else { return }
            guard let dataRsp = try? self.decoder.decode(Response.self, from: content) else { return }
            completion(dataRsp)
        }

        task.resume()
    }

    public func getCards(_ deckID: String, completion: @escaping (Response) -> Void) {
        let url = URL(string: rootURL + "/\(deckID)/draw/?count=52")!
        let task = session.dataTask(with: url) { [unowned self] (data, response, error) in
            guard error == nil else { return }
            guard let content = data else { return }
            guard let dataRsp = try? self.decoder.decode(Response.self, from: content) else { return }
            completion(dataRsp)
        }

        task.resume()
    }
}
