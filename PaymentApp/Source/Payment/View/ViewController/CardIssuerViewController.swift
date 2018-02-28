//
//  CardIssuerViewController.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class CardIssuerViewController: BaseViewController {

    static func get(amount: Double,paymentMethodId: String) -> CardIssuerViewController{
        let bundle = Bundle(for: self)
        let vc = CardIssuerViewController.init(nibName: "CardIssuerViewController", bundle: bundle)
        vc.paymentMethodId = paymentMethodId
        vc.amount = amount
        return vc
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: CardIssuerPresenterProtocol?
    var paymentMethodId = ""
    var amount = 0.0
    var issuers: [CardIssuer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: CardIssuerTableViewCell.NIB_NAME, bundle: nil), forCellReuseIdentifier: CardIssuerTableViewCell.NIB_NAME)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.activityIndicator.hidesWhenStopped = true
        presenter = CardIssuerPresenter.init(delegate: self, repository: InjectionRepository.sharedInstance.getPaymentRepository())
        presenter?.getCardIssuers(paymentMethodId: paymentMethodId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CardIssuerViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issuer = issuers[indexPath.row]
        PaymentFlow.sharedInstance.setCardIssuer(cardIssuer: issuers[indexPath.row])
        let vc = InstallmentViewController.get(amount: amount,paymentMethodId: paymentMethodId, issuer: issuer.issuerId ?? "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension CardIssuerViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let issuer = issuers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CardIssuerTableViewCell.NIB_NAME, for: indexPath) as! CardIssuerTableViewCell
        cell.setData(issuer: issuer)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuers.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension CardIssuerViewController: CardIssuerViewProtocol
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
    func show(issuers: [CardIssuer])
    {
        self.issuers = issuers
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func show(error: String)
    {
        self.showAlert(msg: error)
    }
}
