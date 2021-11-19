//
//  RoundedImageView.swift
//  ASMIO
//
//  Created by Mostafa Samir on 18/11/21.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
