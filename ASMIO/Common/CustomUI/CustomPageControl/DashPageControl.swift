//
//  DashPageControl.swift
//  ASMIO
//
//  Created by Mostafa Samir on 22/11/2021.
//

import UIKit

class DashPageControl: UIPageControl {
    
    let preferredImage:UIImage = #imageLiteral(resourceName: "selected")
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pageIndicatorTintColor = UIColor.lightTextColor
        self.currentPageIndicatorTintColor = UIColor.yellowColor
        if #available(iOS 14.0, *) {
            self.preferredIndicatorImage = preferredImage
        } else {
            // Fallback on earlier versions
        }
        self.clipsToBounds = false
    }
}
