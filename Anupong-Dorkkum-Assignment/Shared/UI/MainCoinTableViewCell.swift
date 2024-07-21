//
//  MainCoinTableViewCell.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import UIKit
import SDWebImage
import SDWebImageSVGCoder

class MainCoinTableViewCell: UITableViewCell {

    private let cardView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // Adjust as needed
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setLabel(type: .cellTitle)
        return label
    }()
    
    private let coinNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setLabel(type: .cellCoinName)
        return label
    }()
    
    private let coinPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setLabel(type: .cellPrice)
        return label
    }()
    
    //add coinPriceLabel as ArrowLabelView
    private let arrowLabelView: ArrowLabelView = {
        let view = ArrowLabelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    private func setupCell() {
        
        //set selection style
        self.selectionStyle = .none
        
        // Add the card view to the content view
        contentView.addSubview(cardView)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(coinPriceLabel)
        contentView.addSubview(arrowLabelView)
        
        // Set constraints for the card view
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
        // Set constraints for the image view
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            iconImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
        
        // Set constraints for the title label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16), // Vertical space from iconImageView
           // titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8)
        ])
        
        // Set constraints for the title label
        NSLayoutConstraint.activate([
            coinNameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            coinNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6), // Vertical space from iconImageView
            coinNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            coinPriceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -8),
            coinPriceLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0), // Vertical space from iconImageView
            coinPriceLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            arrowLabelView.trailingAnchor.constraint(equalTo: coinPriceLabel.trailingAnchor,constant: -12),
            arrowLabelView.centerYAnchor.constraint(equalTo: coinNameLabel.centerYAnchor),
           // arrowLabelView.leadingAnchor.constraint(greaterThanOrEqualTo: coinNameLabel.trailingAnchor, constant: 0)
        ])
    }
    
    func configure(with coin: Coin) {
        //sd_setImage as
        iconImageView.sd_setImage(with: URL(string: coin.iconURL),placeholderImage:UIImage.DesignSystem.placeHolder )
        titleLabel.text = coin.name
        coinNameLabel.text = coin.symbol
        coinPriceLabel.text = coin.price.currencyFormat()
        arrowLabelView.updateView(with: Double(coin.change) ?? 0)
        
        
        }
}
