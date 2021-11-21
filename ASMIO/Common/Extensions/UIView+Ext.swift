//
//  UIView+Ext.swift
//  ASMIO
//
//  Created by Mostafa Samir on 21/11/2021.
//

import UIKit

extension UIView{
    func animateRotation(){
        UIView.animate(withDuration:0.5, animations: { () -> Void in
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            }else{
                self.transform = .identity
            }
        })
    }
}
