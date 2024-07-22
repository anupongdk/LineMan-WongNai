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
        label.setLabel(type: .notFoundTitle)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.setLabel(type: .notFoundDescription)
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
        addSubview(descriptionLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
            ])
    }
    
    // MARK: - Actions
    
    func configure(with title: String, buttonTitle: String) {
        titleLabel.text = title
        button.setTitle(buttonTitle, for: .normal)
        descriptionLabel.isHidden = true
        button.isHidden = false
    }
    
    func configure(with title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        button.isHidden = true
        descriptionLabel.isHidden = false
    }
    
    @objc private func didTapButton() {
        delegate?.didTapButton()
    }
}
