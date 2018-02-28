//
//  PaymentMethodTableViewCell.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

import SDWebImage

class PaymentMethodTableViewCell: UITableViewCell {

    static let NIB_NAME = "PaymentMethodTableViewCell"
    
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
    
    func setData(method: PaymentMethod){
        self.iconImageView.image = nil
        self.titleLabel.text = ""
        if let url = URL.init(string: (method.secure_thumbnail ?? ""))
        {
            self.iconImageView.sd_setImage(with: url, completed: nil)
        }
        self.titleLabel.text = method.name
        
    }
}
