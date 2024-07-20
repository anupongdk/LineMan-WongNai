//
//  AppAPI.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 20/7/2567 BE.
//

import Foundation
import Moya

enum CoinAPI {
    case getCoins
    case search(keyword: String)
    case coinDetail(uuid: String)
}

extension CoinAPI: TargetType {

    var baseURL: URL {
        return Config.baseURL
    }

    var path: String {
        switch self {
        case .getCoins:
            return "/coins"
        case .search:
            return "/coins"
        case .coinDetail(let uuid):
            return "/coin/\(uuid)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .getCoins, .coinDetail:
            return .requestPlain
        case .search(let keyword):
            return .requestParameters(parameters: ["search": keyword], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}
