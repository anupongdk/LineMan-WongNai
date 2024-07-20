//
//  AppDesignSystem.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 20/7/2567 BE.
//

import UIKit
import Foundation

public extension UIFont {
    
    struct DesignSystem {
        static let bold = "Roboto-Bold"
        
        public static let headerTitleFont = UIFont(name: bold, size: 16)
        public static let coinCellTitleFont = UIFont(name: bold, size: 16)
        public static let coinCellNameFont = UIFont(name: bold, size: 14)
        public static let coinCellPriceFont = UIFont(name: bold, size: 14)
    }
}


extension UIColor {
    struct DesignSystem {
        // primary colors =  #000000
        static let appBlackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        // secondary colors =  #999999;
        static let appGreyColor = UIColor(red: 153, green: 153, blue: 153, alpha: 1)
        
        // tertiary colors =   #F7931A;
        static let appOrangeColor = UIColor(red: 247, green: 147, blue: 26, alpha: 1)

        //app green color =  #13BC24;
        static let appGreenColor = UIColor(red: 19, green: 188, blue: 36, alpha: 1)
        
        //app red color = #F82D2D
        static let appRedColor = UIColor(red: 248, green: 45, blue: 45, alpha: 1)
        
        //app blue color =  #38A0FF
        static let appBlueColor = UIColor(red: 56, green: 160, blue: 255, alpha: 1)
        
        // app cell background color =  #F9F9F9;
        static let appCellBackgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 1)
        
        // app cell shadow = #0000001A;
        static let appCellShadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
    }
    
}
