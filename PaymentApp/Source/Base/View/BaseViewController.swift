//
//  BaseViewController.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showAlert(msg: String){
        let alert = UIAlertController.init(title: StringConstant.APP_NAME, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
