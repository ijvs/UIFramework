//
//  ILHorizontalPickerView.swift
//  UIFramework
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import UIKit

@IBDesignable
public class ILHorizontalPickerView: NibDesignable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBInspectable public var title: String = "Title" {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBInspectable public var mainColor: UIColor = UIColor.black
    
    var optionButtons: [ILOptionButton] = []
    var selectedOption: String?
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        #if !TARGET_INTERFACE_BUILDER
            // this code will run in the app itself
        #else
            config(withOptions: ["A", "B", "C", "D", "F"])
        #endif
    }
    
    public func config(withOptions options: [String]) {
        optionButtons = options.enumerated().map { (index, title) -> ILOptionButton in
            let button = ILOptionButton(frame: CGRect.init(x: (index * 90) , y: 0, width: 80, height: 25))
            button.mainColor = mainColor
            button.title = title
            button.delegate = self
            return button
        }
        
        optionButtons.forEach { (button) in
            scrollView.addSubview(button)
        }
        scrollView.contentSize = CGSize(width: optionButtons.count * 90, height: 25)
    }
    
}

extension ILHorizontalPickerView: ILOptionButtonDelegate {
    public func didTapOption(sender: ILOptionButton) {
        selectedOption = sender.title
        optionButtons.forEach { (button) in
            if sender.title != button.title {
                button.isSelected = false
            }
        }
    }
}
