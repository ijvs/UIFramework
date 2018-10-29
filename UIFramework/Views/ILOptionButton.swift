//
//  ILOptionButton.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import Foundation
import UIKit

public protocol ILOptionButtonDelegate: class {
    func didTapOption(sender: ILOptionButton)
}

@IBDesignable
public class ILOptionButton: NibDesignable {
    
    public weak var delegate: ILOptionButtonDelegate?
    @IBOutlet weak var button: UIButton!
    
    @IBInspectable var mainColor: UIColor = UIColor.black {
        didSet{
            updateState()
        }
    }
    
    var isSelected: Bool = false {
        didSet{
            updateState()
        }
    }
    
    @IBInspectable var title: String = "" {
        didSet{
            button.setTitle(title, for: .normal)
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
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        updateState()
    }
    
    func updateState() {
        if isSelected {
            button.setTitleColor(.white, for: .normal)
            self.layer.borderColor = UIColor.clear.cgColor
            self.backgroundColor = mainColor
        }else{
            button.setTitleColor(mainColor, for: .normal)
            self.layer.borderColor = mainColor.cgColor
            self.backgroundColor = .clear
        }
    }
    
    @objc func didTapButton() {
        isSelected = !isSelected
        delegate?.didTapOption(sender: self)
    }
    
}
