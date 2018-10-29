//
//  PaymentMethodCell.swift
//  iOSLove
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/28/18.
//  Copyright © 2018 Jonathan Velazquez. All rights reserved.
//

import UIKit
import UIFramework

class PaymentMethodCell: UITableViewCell {

    @IBOutlet weak var cardView: ILPaymentMethodView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(model: ILPaymentMethodModel) {
        cardView.configure(model)
    }
    
}
