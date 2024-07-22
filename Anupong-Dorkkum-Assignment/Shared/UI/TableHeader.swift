//
//  tableHeader.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 22/7/2567 BE.
//

import UIKit

// table header for MainPageView

class TableHeaderView :UIView {
        
        // MARK: - Properties
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.setLabel(type: .cellTitle)
            label.text = "aaaaaaaaa"
            return label
        }()
        
        // MARK: - Initializers
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }
        
        // MARK: - Setup Methods
        
        private func setupView() {
            backgroundColor = .white
            addSubviews()
           
        }
        
        private func addSubviews() {
            addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
            ])
        }
        
        func setUpView(title: String) {
            titleLabel.text = title
        }
        
    
}
