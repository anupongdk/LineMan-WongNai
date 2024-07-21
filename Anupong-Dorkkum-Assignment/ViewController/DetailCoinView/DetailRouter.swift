//
//  DetailRouter.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import UIKit

extension DetailView {
    
    func navigateToWebsite(url: String) {
        let url = URL(string: url)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func navigeteBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
