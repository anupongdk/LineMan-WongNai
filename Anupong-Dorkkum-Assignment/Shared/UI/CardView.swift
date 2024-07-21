//
//  CardView.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import UIKit

class CardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Set background color
        self.backgroundColor = UIColor.DesignSystem.appCellBackgroundColor

        // Set corner radius
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true

        // Set shadow
        self.layer.shadowColor = UIColor.DesignSystem.appCellShadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
}
