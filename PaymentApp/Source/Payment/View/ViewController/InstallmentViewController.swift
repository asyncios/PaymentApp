//
//  InstallmentViewController.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class InstallmentViewController: BaseViewController {

    static func get(amount: Double, paymentMethodId: String, issuer: String) -> InstallmentViewController{
        let bundle = Bundle(for: self)
        let vc = InstallmentViewController.init(nibName: "InstallmentViewController", bundle: bundle)
        vc.amount = amount
        vc.paymentMethodId = paymentMethodId
        vc.issuer = issuer
        return vc
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: InstallmentPresenterProtocol?
    var paymentMethodId = ""
    var issuer = ""
    var amount = 0.0
    var installment: Installment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: PayerCostTableViewCell.NIB_NAME, bundle: nil), forCellReuseIdentifier: PayerCostTableViewCell.NIB_NAME)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.activityIndicator.hidesWhenStopped = true
        presenter = InstallmentPresenter.init(delegate: self, repository: InjectionRepository.sharedInstance.getPaymentRepository())
        presenter?.getInstallments(amount: amount,paymentMethod: paymentMethodId, issuer: issuer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension InstallmentViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let payerCost = installment?.payer_costs?[indexPath.row] {
            PaymentFlow.sharedInstance.setPayerCost(payerCost: payerCost)
            
            let alert = UIAlertController.init(title: StringConstant.APP_NAME, message: PaymentFlow.sharedInstance.printFlow(), preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (action) in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
        
    }
    
}
extension InstallmentViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let payerCost = installment?.payer_costs?[indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: PayerCostTableViewCell.NIB_NAME, for: indexPath) as! PayerCostTableViewCell
            cell.setData(payerCost: payerCost)
            return cell
        }
        return UITableViewCell()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return installment?.payer_costs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension InstallmentViewController: InstallmentViewProtocol
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
    func show(installment: Installment)
    {
        self.installment = installment
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func show(error: String)
    {
        self.showAlert(msg: error)
    }
}
