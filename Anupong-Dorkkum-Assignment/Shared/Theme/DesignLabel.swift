//
//  DesignLabel.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import UIKit

extension UILabel {
    enum LabelType {
        case tableTitle
        case cellTitle
        case cellPrice
        case cellRateUp
        case cellRateDown
        case detailTitle
        case detailCoinNickName
        case detailCoinPrice
        case notFoundTitle
        case notFoundDescription
    }
    
    func setLabel(type: LabelType) {
        switch type {
        case .tableTitle:
            self.font = UIFont.DesignSystem.bigHeader
            self.textColor = UIColor.DesignSystem.appBlackColor
        case .cellTitle:
            self.font = UIFont.DesignSystem.title
            self.textColor = UIColor.DesignSystem.appBlackColor
        case .cellPrice:
            self.font = UIFont.DesignSystem.description
            self.textColor = UIColor.DesignSystem.appBlackColor
        case .cellRateUp:
            self.font = UIFont.DesignSystem.small
            self.textColor = UIColor.DesignSystem.appGreenColor
        case .cellRateDown:
            self.font = UIFont.DesignSystem.small
            self.textColor = UIColor.DesignSystem.appRedColor
        case .detailTitle:
            self.font = UIFont.DesignSystem.bigHeader
            self.textColor = UIColor.DesignSystem.appBlackColor
        case .detailCoinNickName:
            self.font = UIFont.DesignSystem.title
            self.textColor = UIColor.DesignSystem.appBlackColor
        case .detailCoinPrice:
            self.font = UIFont.DesignSystem.description
            self.textColor = UIColor.DesignSystem.appBlackColor
        case .notFoundTitle:
            self.font = UIFont.DesignSystem.bigHeader
            self.textColor = UIColor.DesignSystem.appNotFoundTitleColor
        case .notFoundDescription:
            self.font = UIFont.DesignSystem.description
            self.textColor = UIColor.DesignSystem.appNotFoundTitleColor
        }
    }
}
