//
//  CardIssuerTableViewCell.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class CardIssuerTableViewCell: UITableViewCell {

    static let NIB_NAME = "CardIssuerTableViewCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(issuer: CardIssuer){
        self.iconImageView.image = nil
        self.titleLabel.text = ""
        if let url = URL.init(string: (issuer.secure_thumbnail ?? ""))
        {
            self.iconImageView.sd_setImage(with: url, completed: nil)
        }
        self.titleLabel.text = issuer.name
        
    }
}
