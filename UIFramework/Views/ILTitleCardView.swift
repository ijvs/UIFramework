//
//  ILTitleCardView.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

public class ILTitleCardView: NibDesignable {
    
    @IBOutlet weak public var titleLabel: UILabel!
    @IBOutlet weak public var valueLabel: UILabel!
    @IBOutlet weak var accesoryButton: UIButton!
    
    @IBInspectable public var showAccesory: Bool = true {
        didSet{
            accesoryButton.isHidden = !showAccesory
        }
    }
    
    @IBInspectable public var accessoryImage: UIImage? {
        didSet{
            accesoryButton.setImage(accessoryImage, for: .normal)
        }
    }
    
    @IBInspectable var title: String = "Title" {
        didSet{
            titleLabel.text = title
        }
    }
    
    @IBInspectable var valueText: String = "$1,000.00" {
        didSet{
            valueLabel.text = valueText
        }
    }
}

