//
//  Router.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import UIKit

// router for MainPageView

extension MainPageView {
    
    func navigateToDetail(uuid: String) {
       
        let vm = DetailViewModel(uuid:uuid)
        let detailVC = DetailView(viewModel: vm)

        detailVC.modalPresentationStyle = .pageSheet
        present(detailVC, animated: true, completion: nil)
    }
}
