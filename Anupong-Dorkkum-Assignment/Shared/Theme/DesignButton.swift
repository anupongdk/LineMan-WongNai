//
//  DesignButton.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 22/7/2567 BE.
//

import UIKit

extension UIButton {
    enum AppButtonType {
        case closeButton
        case gotoWebsite
    }
    
    func setButton(type: AppButtonType) {
        switch type {
        case .closeButton:
            self.setImage(UIImage(named: "icClose"), for: .normal)
            self.tintColor = UIColor.DesignSystem.appGreyColor
        case .gotoWebsite:
            self.setTitle("", for: .normal)
            self.setTitleColor(UIColor.DesignSystem.appBlueColor, for: .normal)
            self.backgroundColor = UIColor.DesignSystem.appCellBackgroundColor
            // set font
            self.titleLabel?.font = UIFont.DesignSystem.title
        }
    }
}
