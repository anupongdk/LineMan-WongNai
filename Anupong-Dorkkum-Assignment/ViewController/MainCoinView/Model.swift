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
    let data: CoinData
}

struct CoinData: Decodable {
    let coins: [Coin]
}


struct Coin: Decodable {
    let uuid: String
    let name: String
}
