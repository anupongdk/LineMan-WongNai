//
//  View.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation
import UIKit
import SDWebImage
import SDWebImageSVGCoder

class DetailView: UIViewController {
    let viewModel: DetailViewModel
    private var errorView: ErrorView?
    
    @IBOutlet weak var imageCoin: UIImageView!
    @IBOutlet weak var lblCoinName: UILabel!
    @IBOutlet weak var lblCoinSymbol: UILabel!
    @IBOutlet weak var lblCoinPrice: UILabel!
    @IBOutlet weak var lblCoinPriceValue: UILabel!
    @IBOutlet weak var lblCoinMarketCap: UILabel!
    @IBOutlet weak var lblCoinMarketCapValue: UILabel!
    @IBOutlet weak var tvCoinDetail: UITextView!
    @IBOutlet weak var btnGotoWeb: UIButton!
    
    
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
        viewModel.fetchDetail()
        
    }
    
    func bindViewModel() {
        viewModel.onDetailLoaded = { [weak self] in
            // Update the UI here
            self?.updateUI(state: .loaded)
        }
        
        viewModel.onError = { [weak self] error in
            // Handle the error here
            self?.updateUI(state: .error)
        }
        
        viewModel.onLoading = { [weak self] in
            // Show loading indicator
            self?.updateUI(state: .loading)
        }
    }
    
    func updateUI(state:ViewState){
        switch state {
        case .loading:
            errorView?.isHidden = true
        case .loaded:
            // show go to website button
            btnGotoWeb.isHidden = false
            
            //static Ui
            lblCoinPrice.text = "PRICE"
            lblCoinMarketCap.text = "MARKET CAP"
            
            // Update the UI here
            lblCoinName.text = viewModel.detailData?.name
            lblCoinName.textColor = UIColor.init(hex: viewModel.detailData?.color ?? "")
            lblCoinSymbol.text = viewModel.detailData?.symbol.addParentheses()
            lblCoinPriceValue.text = viewModel.detailData?.price.currencyFormat(maxFractionDigits: 2,currencySymbol: "$ ")
            lblCoinMarketCapValue.text = viewModel.detailData?.marketCap.addSuffix(currencySymbol: "$ ")
            tvCoinDetail.text = viewModel.detailData?.description
            imageCoin.sd_setImage(with: URL(string: viewModel.detailData?.iconURL ?? ""), placeholderImage: UIImage.DesignSystem.placeHolder)
            
        case .error:
            // hide go to website button
            btnGotoWeb.isHidden = true
           // add error label middle of view
            errorView?.isHidden = false
            
        }
    }
    
    private func setupUI() {
        
        errorView = ErrorView()
        errorView?.delegate = self
        view.addSubview(errorView!)
        errorView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorView!.topAnchor.constraint(equalTo: view.topAnchor),
            errorView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        errorView?.configure(with: "Could Not load data", buttonTitle: "Try again")
        
        
        // Create and configure the close button
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(named: "icClose"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        // Add the close button to the view
        view.addSubview(closeButton)
        
        closeButton.setButton(type: .closeButton)
        // Set constraints for the close button
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            closeButton.widthAnchor.constraint(equalToConstant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        lblCoinName.setLabel(type: .detailTitle)
        lblCoinSymbol.setLabel(type: .detailCoinNickName)
        lblCoinPrice.setLabel(type: .detailCoinPrice)
        lblCoinPriceValue.setLabel(type: .detailCoinValue)
        lblCoinMarketCap.setLabel(type: .detailCoinPrice)
        lblCoinMarketCapValue.setLabel(type: .detailCoinValue)
        
        tvCoinDetail.textColor = UIColor.DesignSystem.appGreyColor
        tvCoinDetail.font = UIFont.DesignSystem.description
        tvCoinDetail.isEditable = false
        
        
        lblCoinName.text = ""
        lblCoinSymbol.text = ""
        lblCoinPrice.text = ""
        lblCoinPriceValue.text = ""
        lblCoinMarketCap.text = ""
        lblCoinMarketCapValue.text = ""
        tvCoinDetail.text = ""
        
        btnGotoWeb.setButton(type: .gotoWebsite)
        btnGotoWeb.setTitle("GO TO WEBSITE", for: .normal)

        // create header image

    }
    
    @objc private func closeButtonTapped() {
        navigeteBack()
    }
    @IBAction func gotoWebSite(_ sender: Any) {
        navigateToWebsite(url: viewModel.detailData?.websiteURL ?? "")
    }
}


extension DetailView:ErrorViewDelegate {
    func didTapButton() {
        viewModel.fetchDetail()
        
    }
}
