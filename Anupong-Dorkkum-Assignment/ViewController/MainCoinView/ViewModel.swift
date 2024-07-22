//
//

import Foundation

class MainPageViewModel {
    private let apiManager = MainPageAPIManager()
    private var coins: [Coin] = []
    private let limitedCoinPerPage = 10
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
        apiManager.getCoins(limit: limitedCoinPerPage, offset: numberOfCoins) { [weak self] result in
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
    
    // function calculate index is match for position 5, 10, 20, 40, 80, 160, ...
    func isPowIndex(index: Int) -> Bool {
        var position = 5
        while position <= index {
            if position == index {
                return true
            }
            position *= 2
        }
        return false
    }
}
