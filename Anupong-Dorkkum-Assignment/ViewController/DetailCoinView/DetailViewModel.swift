//
//  ViewModel.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation

class DetailViewModel {
    private let apiManager:DetailAPIManager!
    let uuid: String
    var detailData: DetailModel.Coin?
    
    var onDetailLoaded: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    init(uuid: String,apiManager:DetailAPIManager) {
        self.uuid = uuid
        self.apiManager = apiManager
    }
    
    
   func fetchDetail() {
        apiManager.getCoinDetail(uuid: uuid) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    let coinResponse = try JSONDecoder().decode(DetailModel.Response.self, from: response.data)
                    self?.detailData = coinResponse.data.coin
                    self?.onDetailLoaded?()
                } catch let error {
                    self?.onError?(error)
                }
                
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
}
