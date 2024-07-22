//
//  Created by Aman on 27/07/23.
//

import Foundation

struct MainPageModel {
    // Model properties and methods here

    init() {
        // Initialization code
    }

    // Add your Model methods here
}


struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}

struct CoinData: Decodable {
    let stats: Stats
    let coins: [Coin]
}


// MARK: - Coin
struct Coin: Codable {
    let uuid, symbol, name: String
    let iconURL: String
    let marketCap, price, change: String?
    let listedAt:Int?
    let tier: Int
    let rank: Int
    let sparkline: [String?]
    let lowVolume: Bool?
    let coinrankingURL: String
    let the24HVolume, btcPrice, color: String?
    let contractAddresses: [String]
    
    

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color
        case iconURL = "iconUrl"
        case marketCap, price, listedAt, tier, change, rank, sparkline, lowVolume
        case coinrankingURL = "coinrankingUrl"
        case the24HVolume = "24hVolume"
        case btcPrice, contractAddresses
    }
}

// MARK: - Stats
struct Stats: Codable {
    let total, totalCoins, totalMarkets, totalExchanges: Int
    let totalMarketCap, total24HVolume: String

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}
