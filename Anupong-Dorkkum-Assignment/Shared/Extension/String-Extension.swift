//
//  String-Extension.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation

// extension String get "0.9995445928890201" return "$ 0.99954"

extension String {
    func currencyFormat(maxFractionDigits: Int = 5,currencySymbol: String = "$") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = maxFractionDigits
        formatter.minimumFractionDigits = 0
        formatter.currencySymbol = currencySymbol
        if let number = Double(self) {
            return formatter.string(from: NSNumber(value: number)) ?? self
        }
        return self
    }
    
    // add () to string
    func addParentheses() -> String {
        return "(\(self))"
    }
    
    // add trillion billion million
    func addSuffix(maxFractionDigits: Int = 2,currencySymbol: String = "$") -> String {
        let number = Double(self) ?? 0
        let suffix = ["", "million", "billion", "trillion"]
        var index = 0
        var num = number
        while num >= 10000 {
            num = num / 10000
            index += 1
        }
        
        //num maxFractionDigits
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .decimal
        
        return "\(currencySymbol)\(formatter.string(from: NSNumber(value: num)) ?? "") \(suffix[index])"

    }
}
