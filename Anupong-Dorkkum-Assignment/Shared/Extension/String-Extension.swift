//
//  String-Extension.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation

// extension String get "0.9995445928890201" return "$ 0.99954"

extension String {
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 5
        formatter.minimumFractionDigits = 0
        formatter.currencySymbol = "$"
        if let number = Double(self) {
            return formatter.string(from: NSNumber(value: number)) ?? self
        }
        return self
    }
}
