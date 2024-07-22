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
       let apiManager = DetailAPIManager()
        let vm = DetailViewModel(uuid:uuid,apiManager:apiManager)
        let detailVC = DetailView(viewModel: vm)

        detailVC.modalPresentationStyle = .pageSheet
        present(detailVC, animated: true, completion: nil)
    }
    
    func openShareSheet(shareContent: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
    }
}
