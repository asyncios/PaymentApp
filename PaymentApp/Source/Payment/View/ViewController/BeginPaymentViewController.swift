//
//  BeginPaymentViewController.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/24/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit
import Alamofire

class BeginPaymentViewController: BaseViewController {

    @IBOutlet weak var amountTextField: UITextField!
    var presenter: BeginPaymentPresenter?
    static func get() -> BeginPaymentViewController{
        let bundle = Bundle(for: self)
        return BeginPaymentViewController.init(nibName: "BeginPaymentViewController", bundle: bundle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = BeginPaymentPresenter.init(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func continueTouchUp(_ sender: Any) {
        self.presenter?.applyAmount(string: amountTextField.text ?? "")
    }
}

extension BeginPaymentViewController: BeginPaymentViewProtocol{
    func show(value: Double) {
        PaymentFlow.sharedInstance.startFlow(amount: value)
        let vc = PaymentMethodsViewController.get(amount: value)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func show(error: String) {
        self.showAlert(msg: error)
    }
}
