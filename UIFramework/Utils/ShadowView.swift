//
//  ShadowView.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable public var borderRadius: CGFloat = 0 {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: 0, height: 2) {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 0.2 {
        didSet {
            self.setup()
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 5 {
        didSet {
            self.setup()
        }
    }
    
    public override var bounds: CGRect {
        didSet {
            self.setup()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = self.borderRadius
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOpacity = Float(self.shadowOpacity)
        self.layer.shadowPath = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(
                width: self.borderRadius,
                height: self.borderRadius)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
