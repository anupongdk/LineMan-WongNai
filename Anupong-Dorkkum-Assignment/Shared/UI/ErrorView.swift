//
//  ErrorView.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 22/7/2567 BE.
//

import UIKit

// ErrorViewDelegate
protocol ErrorViewDelegate {
    func didTapButton()
}

class ErrorView: UIView {
    
    // MARK: - Properties
    
    var delegate: ErrorViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.DesignSystem.title
        label.textColor = UIColor.DesignSystem.appGreyColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setButton(type: .gotoWebsite)
        button.setTitle("Try again", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.backgroundColor = .clear
        return button
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
        addSubview(titleLabel)
        addSubview(button)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Center the label in the view
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // Position the button under the label
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }
    
    // MARK: - Actions
    
    func configure(with title: String, buttonTitle: String) {
        titleLabel.text = title
        button.setTitle(buttonTitle, for: .normal)
    }
    
    @objc private func didTapButton() {
        delegate?.didTapButton()
    }
}
