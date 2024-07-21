//
//  ViewModel.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation

class DetailViewModel {
    let uuid: String
    
    var onDetailLoaded: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    init(uuid: String) {
        self.uuid = uuid
    }
    
   
    
}
