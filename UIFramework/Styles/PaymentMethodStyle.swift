//
//  PaymentMethodStyle.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import Foundation

public enum PaymentMethodStyle {
    case skyBlue
    case oceanBlue
    case lemonGreen
    case red
    case yellow
    case purple
    case gray
    
    public var gradient: UIImage? {
        switch self {
        case .skyBlue:
            return UIImage(named: "skyBlueGradient")
        case .oceanBlue:
            return UIImage(named: "oceanBlueGradient")
        case .lemonGreen:
            return UIImage(named: "lemonGreenGradient")
        case .red:
            return UIImage(named: "redGradient")
        case .yellow:
            return UIImage(named: "yellowGradient")
        case .purple:
            return UIImage(named: "purpleGradient")
        case .gray:
            return UIImage(named: "grayGradient")
        }
    }
    
    public var tintColor: UIColor {
        switch self {
        case .skyBlue, .oceanBlue, .lemonGreen, .red, .yellow, .purple:
            return UIColor(named: "white") ?? .white
        case .gray:
            return UIColor(named: "dark") ?? .black
        }
    }
}
