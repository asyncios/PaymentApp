//
//  PaymentMethodsViewController.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PaymentMethodsViewController: BaseViewController {

    static func get(amount: Double) -> PaymentMethodsViewController{
        let bundle = Bundle(for: self)
        let vc = PaymentMethodsViewController.init(nibName: "PaymentMethodsViewController", bundle: bundle)
        vc.amount = amount
        return vc
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: PaymentMethodsPresenterProtocol?
    var methods: [PaymentMethod] = []
    var amount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: PaymentMethodTableViewCell.NIB_NAME, bundle: nil), forCellReuseIdentifier: PaymentMethodTableViewCell.NIB_NAME)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.activityIndicator.hidesWhenStopped = true
        presenter = PaymentMethodsPresenter.init(delegate: self, repository: InjectionRepository.sharedInstance.getPaymentRepository())
        presenter?.getPaymentMethods()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension PaymentMethodsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PaymentFlow.sharedInstance.setPayment(payment: methods[indexPath.row])
        let vc = InputCardViewController.get(paymentMethodId: methods[indexPath.row].paymentMethodId ?? "")
        vc.delegate = self
        let nv = UINavigationController.init(rootViewController: vc)
        nv.navigationBar.isTranslucent = false
        self.present(nv, animated: true, completion: nil)
    }
}

extension PaymentMethodsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let method = methods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentMethodTableViewCell.NIB_NAME, for: indexPath) as! PaymentMethodTableViewCell
        cell.setData(method: method)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension PaymentMethodsViewController: PaymentMethodsViewProtocol
{
    func show(loading: Bool)
    {
        if loading{
            self.activityIndicator.startAnimating()
        }
        else{
            self.activityIndicator.stopAnimating()
        }
    }
    func show(methods: [PaymentMethod])
    {
        self.methods = methods
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func show(error: String)
    {
        self.showAlert(msg: error)
    }
}

extension PaymentMethodsViewController: InputCardViewControllerProtocol
{
    func success(paymentMethodId: String,card: CustomCard) {
        let vc = CardIssuerViewController.get(amount: amount,paymentMethodId: paymentMethodId)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
