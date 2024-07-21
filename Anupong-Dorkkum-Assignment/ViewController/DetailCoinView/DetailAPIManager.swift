//
//  APIManager.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation
import Moya

class DetailAPIManager {
    private let provider = MoyaProvider<CoinAPI>()
    
    func getCoinDetail(uuid: String, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.coinDetail(uuid: uuid), completion: completion)
    }
}
