//
//  ILPaymentMethodView.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import UIKit

//public protocol ILPaymentMethodModel {
//    var style: PaymentMethodStyle { get set }
//    var brand: String { get set }
//    var cardNumber: String { get set }
//    var accessoryButtonImage: UIImage? { get set }
//}

public struct ILPaymentMethodModel {
    var style: PaymentMethodStyle
    var brand: String
    var cardNumber: String
    var accessoryButtonImage: UIImage?
    
    public init(style: PaymentMethodStyle, brand: String, cardNumber: String, accessoryButtonImage: UIImage? = nil){
        self.style = style
        self.brand = brand
        self.cardNumber = cardNumber
        self.accessoryButtonImage = accessoryButtonImage
    }
}

public protocol ILPaymentMethodViewDelegate: class {
    func didTapView(mod: ILPaymentMethodView)
    func didTapAccessoryButton(mod: ILPaymentMethodView)
}

@IBDesignable
public class ILPaymentMethodView: NibDesignable {
    
    weak public var delegate: ILPaymentMethodViewDelegate?
    
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var accessoryButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        
        #if TARGET_INTERFACE_BUILDER
            let mockModel = ILPaymentMethodModel(style: PaymentMethodStyle.oceanBlue, brand: "amex", cardNumber: "•••• •••• •••• 1234")
            configure(mockModel)
        #endif

    }
    
    private func setup() {
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.clipsToBounds = true
        self.layer.cornerRadius = 10
        accessoryButton.addTarget(self, action: #selector(didTapAccessoryButton), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.addGestureRecognizer(tapGesture)        
    }
    
    public func configure(_ model: ILPaymentMethodModel) {
        brandImageView.image = UIImage(named: model.brand, in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)
        cardNumberLabel.text = model.cardNumber
        backgroundImageView.image = model.style.gradient
        cardNumberLabel.textColor = model.style.tintColor
        accessoryButton.imageView?.tintColor = model.style.tintColor
        
        if let accessoryImage = model.accessoryButtonImage {
            accessoryButton.setImage(accessoryImage, for: .normal)
            accessoryButton.isHidden = false
        }else{
            accessoryButton.isHidden = true
        }
    }
    
    @objc func didTapView() {
        delegate?.didTapView(mod: self)
    }
    
    @objc func didTapAccessoryButton(){
        delegate?.didTapAccessoryButton(mod: self)
    }
}
