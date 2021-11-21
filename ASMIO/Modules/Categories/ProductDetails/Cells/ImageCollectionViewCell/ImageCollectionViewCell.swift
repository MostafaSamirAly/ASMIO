//
//  ImageCollectionViewCell.swift
//  ASMIO
//
//  Created by Mostafa Samir on 22/11/2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: Image?) {
        productImageView.setImage(with: image?.mediumImageURL ?? "")
    }

}
