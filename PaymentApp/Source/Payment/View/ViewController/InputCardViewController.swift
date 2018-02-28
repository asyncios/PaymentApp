//
//  InputCardViewController.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol InputCardViewControllerProtocol
{
    func success(paymentMethodId: String,card: CustomCard)
}

class InputCardViewController: BaseViewController {

    var delegate: InputCardViewControllerProtocol?
    
    @IBOutlet weak var cardTextFleld: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    var paymentMethodId = ""
    
    static func get(paymentMethodId: String) -> InputCardViewController{
        let bundle = Bundle(for: self)
        let vc = InputCardViewController.init(nibName: "InputCardViewController", bundle: bundle)
        vc.paymentMethodId = paymentMethodId
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueTouchUp(_ sender: Any) {
        if let cardNumer = cardTextFleld.text,
            let month = monthTextField.text,
            let year = yearTextField.text,
            let cvc = cvcTextField.text {
            let card = CustomCard.init(card: cardNumer, month: month, year: year, cvc: cvc)
            self.delegate?.success(paymentMethodId: paymentMethodId, card: card)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelTouchUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
