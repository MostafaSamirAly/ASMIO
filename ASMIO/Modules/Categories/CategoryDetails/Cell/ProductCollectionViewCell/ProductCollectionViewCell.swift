//
//  ProductCollectionViewCell.swift
//  ASMIO
//
//  Created by Mostafa Samir on 19/11/2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var discountPercentageLabel: UILabel!
    @IBOutlet weak var productImageView: RoundedImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var optionsView: RoundedView!
    @IBOutlet weak var optionsLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productFinalPriceLabel: UILabel!
    @IBOutlet weak var productOriginalPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var isFavorite = false
    var canAddToCart = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with product: Product) {
        if product.variants?.isEmpty ?? true {
            canAddToCart = true
            addToCartButton.setImage(#imageLiteral(resourceName: "Cart-Icon"), for: .normal)
            optionsView.isHidden = true
        }else {
            canAddToCart = false
            addToCartButton.setImage(#imageLiteral(resourceName: "View-Icon"), for: .normal)
            optionsView.isHidden = false
            optionsLabel.text = "\(product.variants?.count ?? 0) more options"
        }
        if product.isSaved ?? false {
            isFavorite = true
            favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            isFavorite = false
            favoriteButton.setImage(#imageLiteral(resourceName: "not-favorite"), for: .normal)
        }
        if product.inCart ?? false {
            // to do add "added to cart icon" (not downloadable from XD)
        }else {
            addToCartButton.setImage(#imageLiteral(resourceName: "Cart-Icon"), for: .normal)
        }
        productImageView.setImage(with: product.baseImage?.mediumImageURL ?? "")
        productNameLabel.text = product.name
        productFinalPriceLabel.text = product.finalPrice?.dropFirst(4).description
        if let discount = product.discount,
           !discount.isEmpty {
                discountPercentageLabel.isHidden = false
                productOriginalPriceLabel.isHidden = false
                productOriginalPriceLabel.attributedText = product.originalPrice?.strikeThrough()
        }else {
            discountPercentageLabel.isHidden = true
            productOriginalPriceLabel.isHidden = true
        }
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        isFavorite.toggle()
        if isFavorite {
            favoriteButton.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
        }else {
            favoriteButton.setImage(#imageLiteral(resourceName: "not-favorite"), for: .normal)
        }
    }
    @IBAction func addToCartTapped(_ sender: Any) {
        if canAddToCart {
            // to do add "added to cart icon" (not downloadable from XD)
        }
    }
    
}
