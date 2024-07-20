//
//  APIManager.swift
//  SharedAPIManager
//
//  Created by Aman on 04/08/23.
//

import UIKit
import Foundation
import Moya

class MainPageAPIManager {
    private let provider = MoyaProvider<CoinAPI>()

    func getCoins(completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.getCoins, completion: completion)
    }

    func searchCoins(keyword: String, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.search(keyword: keyword), completion: completion)
    }

    func getCoinDetail(uuid: String, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.coinDetail(uuid: uuid), completion: completion)
    }
}
