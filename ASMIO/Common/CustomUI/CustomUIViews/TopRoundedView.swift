//
//  TopRoundedView.swift
//  ASMIO
//
//  Created by Mostafa Samir on 20/11/2021.
//

import UIKit

class TopRoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: cornerRadius, height: 0)).cgPath
        self.layer.mask = rectShape
        self.clipsToBounds = true
    }
}
