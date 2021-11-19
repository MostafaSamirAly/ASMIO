//
//  CircleImageView.swift
//  ASMIO
//
//  Created by Mostafa Samir on 18/11/21.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
    }
}
