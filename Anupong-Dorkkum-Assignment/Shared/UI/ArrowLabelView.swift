//
//  ArrowLabelView.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import UIKit


class ArrowLabelView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        addSubview(imageView)
        addSubview(label)
        
        // Center the label in the view
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // Position the imageView to the left of the label
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func updateView(with value: Double) {
        if value < 0 {
            imageView.image = UIImage(named: "icArrowDown")
            label.setLabel(type: .cellRateDown)
        } else {
            imageView.image = UIImage(named: "icArrowUp")
            label.setLabel(type: .cellRateUp)
        }
        label.text = abs(value).formatted()
    }
}
