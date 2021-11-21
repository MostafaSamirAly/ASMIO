//
//  SpecificationsTableViewCell.swift
//  ASMIO
//
//  Created by Mostafa Samir on 21/11/2021.
//

import UIKit

class SpecificationsTableViewCell: UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with specification: Specification?, index: Int) {
        keyLabel.text = specification?.key
        value.text = specification?.value
        if index % 2 == 0 {
            contentView.backgroundColor = UIColor.backGroundColor
        }else {
            contentView.backgroundColor = UIColor(hexString: "#F1F2F5")
        }
    }
    
}
