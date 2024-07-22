//
//  APIManager.swift
//  SharedAPIManager
//
//

import UIKit
import Foundation
import Moya

class MainPageAPIManager {
    private let provider = MoyaProvider<CoinAPI>()

    func getCoins(limit: Int, offset: Int, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.getCoins(limit: limit, offset: offset), completion: completion)
    }
    
   
    func searchCoins(keyword: String, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.search(keyword: keyword), completion: completion)
    }

}
