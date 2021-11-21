//
//  SortTableViewCell.swift
//  ASMIO
//
//  Created by Mostafa Samir on 20/11/2021.
//

import UIKit

class SortTableViewCell: UITableViewCell {
    @IBOutlet weak var sortOptionNameLabel: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with name: String, selection: Bool) {
        sortOptionNameLabel.text = name
        selectedImageView.isHidden = !selection
    }
    
}
