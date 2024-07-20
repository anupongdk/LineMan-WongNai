//
//  Created by Aman on 27/07/23.
//

import Foundation

class MainPageViewModel {
    private let apiManager = MainPageAPIManager()
    private var coins: [Coin] = []
    private var currentPage = 0
    private var isLoading = false

    var onCoinsUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?

    var numberOfCoins: Int {
        return coins.count
    }

    func coin(at index: Int) -> Coin {
        return coins[index]
    }

    func fetchCoins() {
        guard !isLoading else { return }
        isLoading = true
        apiManager.getCoins { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                do {
                    let coinResponse = try JSONDecoder().decode(CoinResponse.self, from: response.data)
                    self?.coins.append(contentsOf: coinResponse.data.coins)
                    self?.onCoinsUpdated?()
                } catch let error {
                    self?.onError?(error)
                }
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }

    func searchCoins(keyword: String) {
        guard !isLoading else { return }
        isLoading = true
        apiManager.searchCoins(keyword: keyword) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                do {
                    let coinResponse = try JSONDecoder().decode(CoinResponse.self, from: response.data)
                    self?.coins = coinResponse.data.coins
                    self?.onCoinsUpdated?()
                } catch let error {
                    self?.onError?(error)
                }
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}
