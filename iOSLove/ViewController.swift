//
//  ViewController.swift
//  iOSLove
//
//  Created by Israel Jonathan Velázquez Sánchez on 10/26/18.
//  Copyright © 2018 AVACO. All rights reserved.
//

import UIKit
import UIFramework

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: "PaymentMethodCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodCell")
        tableView.register(UINib(nibName: "TitleCardCell", bundle: nil), forCellReuseIdentifier: "TitleCardCell")
        tableView.register(ComponentTableViewCell<ILHorizontalPickerView>.self, forCellReuseIdentifier: "ILHorizontalPickerView")
//        tableView.register(ComponentTableViewCell<ILPaymentMethodView>.self, forCellReuseIdentifier: "paymentMethodCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCardCell") as! TitleCardCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ILHorizontalPickerView") as! ComponentTableViewCell<ILHorizontalPickerView>
            cell.uiClass?.title = "Monto de Recarga"
            cell.uiClass?.mainColor = UIColor(named: "mainColor", in: Bundle(identifier: "space.siker.UIFramework"), compatibleWith: nil)!
            cell.uiClass?.config(withOptions: ["$100.00", "$200.00", "$300.00", "$400.00", "$500.00"])
            return cell
        case 1...5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell") as! PaymentMethodCell
            cell.setCell(model: ILPaymentMethodModel(style: .lemonGreen, brand: "visa", cardNumber: "•••• •••• •••• 1111"))
            return cell
        case 6...10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell") as! PaymentMethodCell
            cell.setCell(model: ILPaymentMethodModel(style: .red, brand: "visa", cardNumber: "•••• •••• •••• 1111"))
            return cell
        case 11...15:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell") as! PaymentMethodCell
            cell.setCell(model: ILPaymentMethodModel(style: .skyBlue, brand: "visa", cardNumber: "•••• •••• •••• 1111"))
            return cell
        case 16...20:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell") as! PaymentMethodCell
            cell.setCell(model: ILPaymentMethodModel(style: .yellow, brand: "visa", cardNumber: "•••• •••• •••• 1111"))
            return cell
        default:
            fatalError()
        }
    }
}

