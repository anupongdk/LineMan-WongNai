//
//  AppDesignSystem.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 20/7/2567 BE.
//

import UIKit
import Foundation

 extension UIFont {
    
    struct DesignSystem {
        static let bold = "Roboto-Bold"
        
         static let bigHeader = UIFont(name: bold, size: 18)
         static let title = UIFont(name: bold, size: 16)
         static let description = UIFont(name: bold, size: 14)
         static let small = UIFont(name: bold, size: 12)
         
    }
}


 extension UIColor {
     struct DesignSystem {
             // primary colors =  #000000
             public static let appBlackColor = UIColor(hex: "#000000")
             
             // secondary colors =  #999999;
             static let appGreyColor = UIColor(hex: "#999999")
             
             // tertiary colors =   #F7931A;
             static let appOrangeColor = UIColor(hex: "#F7931A")

             //app green color =  #13BC24;
             static let appGreenColor = UIColor(hex: "#13BC24")
             
             //app red color = #F82D2D
             static let appRedColor = UIColor(hex: "#F82D2D")
                     
             //app blue color =  #38A0FF
             static let appBlueColor = UIColor(hex: "#38A0FF")
             
             // app cell background color =  #F9F9F9;
             static let appCellBackgroundColor = UIColor(hex: "#F9F9F9")
             
             // app cell shadow = #0000001A;
             static let appCellShadowColor = UIColor(hex: "#000000", alpha: 0.1)
             
             // app Not found title = #333333;
             static let appNotFoundTitleColor = UIColor(hex: "#333333")
         }
    
}

extension UIImage {
    struct DesignSystem {
        static let appLogo = UIImage(named: "appLogo")
        static let placeHolder = UIImage(systemName: "photo.circle.fill")
    }
}


extension UIColor {
    convenience init(hex: String,alpha:Float = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
}
