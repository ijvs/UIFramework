//
//  ComponentTableViewCell.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

public class ComponentTableViewCell <UIClass: UIView>: UITableViewCell {
    
    public var uiClass: UIClass?
    public var insets: UIEdgeInsets?
    var horizontalConstraints: [NSLayoutConstraint]?
    var verticalConstraints: [NSLayoutConstraint]?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        uiClass = UIClass()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        uiClass = UIClass()
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(uiClass!)
        setupModConstraints()
    }
    
    func setupModConstraints() {
        uiClass?.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": uiClass!])
        contentView.addConstraints(horizontalConstraints!)
        
        verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": uiClass!])
        contentView.addConstraints(verticalConstraints!)
    }
}
