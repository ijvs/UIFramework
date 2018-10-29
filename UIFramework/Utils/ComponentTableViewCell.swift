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
    public var insets: UIEdgeInsets = UIEdgeInsets.zero
    var horizontalConstraints: [NSLayoutConstraint]?
    var verticalConstraints: [NSLayoutConstraint]?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        uiClass = UIClass()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }

    public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, insets: UIEdgeInsets? = nil) {
        uiClass = UIClass()
        self.insets = insets ?? UIEdgeInsets.zero
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
//        guard let uiClass = uiClass else {
//            return
//        }
        
        uiClass?.translatesAutoresizingMaskIntoConstraints = false

        horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(insets.left)-[subview]-\(insets.right)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": uiClass!])
        contentView.addConstraints(horizontalConstraints!)

        verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(insets.top)-[subview]-\(insets.bottom)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": uiClass!])
        contentView.addConstraints(verticalConstraints!)

//        uiClass.translatesAutoresizingMaskIntoConstraints = false
//        uiClass.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left).isActive = true
//        self.trailingAnchor.constraint(equalTo: uiClass.trailingAnchor, constant: insets.right).isActive = true
//        uiClass.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top).isActive = true
//        self.bottomAnchor.constraint(equalTo: uiClass.bottomAnchor, constant: insets.bottom).isActive = true
    }
}
