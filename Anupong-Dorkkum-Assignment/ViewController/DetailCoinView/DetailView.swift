//
//  View.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation

import UIKit

class DetailView: UIViewController {
    let viewModel: DetailViewModel
    
    @IBOutlet weak var imageCoin: UIImageView!
    @IBOutlet weak var lblCoinName: UILabel!
    @IBOutlet weak var lblCoinSymbol: UILabel!
    @IBOutlet weak var lblCoinPrice: UILabel!
    @IBOutlet weak var lblCoinPriceValue: UILabel!
    @IBOutlet weak var lblCoinMarketCap: UILabel!
    @IBOutlet weak var lblCoinMarketCapValue: UILabel!
    
    
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "DetailView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bindViewModel()
        
    }
    
    func bindViewModel() {
        viewModel.onDetailLoaded = { [weak self] in
            // Update the UI here
        }
        
        viewModel.onError = { [weak self] error in
            // Handle the error here
        }
    }
    
    private func setupUI() {
        // Create and configure the close button
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(named: "icClose"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        // Add the close button to the view
        view.addSubview(closeButton)
        
        // Set constraints for the close button
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            closeButton.widthAnchor.constraint(equalToConstant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        
        
        
        // create header image
        
        
    }
    
    @objc private func closeButtonTapped() {
        navigeteBack()
    }
}
