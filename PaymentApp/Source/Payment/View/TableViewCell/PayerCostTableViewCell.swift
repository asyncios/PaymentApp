//
//  PayerCostTableViewCell.swift
//  PaymentApp
//
//  Created by Nisum on 2/28/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PayerCostTableViewCell: UITableViewCell {

    static let NIB_NAME = "PayerCostTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(payerCost: PayerCost){
        self.titleLabel.text = nil
        self.titleLabel.text = payerCost.recommended_message
    }
}
