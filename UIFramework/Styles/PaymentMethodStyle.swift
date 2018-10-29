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
            return UIImage(named: "skyBlueGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        case .oceanBlue:
            return UIImage(named: "oceanBlueGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        case .lemonGreen:
            return UIImage(named: "lemonGreenGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        case .red:
            return UIImage(named: "redGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        case .yellow:
            return UIImage(named: "yellowGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        case .purple:
            return UIImage(named: "purpleGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        case .gray:
            return UIImage(named: "grayGradient", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        }
    }
    
    public var tintColor: UIColor {
        switch self {
        case .skyBlue, .oceanBlue, .lemonGreen, .red, .yellow, .purple:
            return UIColor.white
        case .gray:
            return UIColor.black
        }
    }
}
