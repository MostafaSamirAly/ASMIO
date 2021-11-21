//
//  DashPageControl.swift
//  ASMIO
//
//  Created by Mostafa Samir on 22/11/2021.
//

import UIKit

class DashPageControl: UIPageControl {
    
    let activeImage:UIImage = #imageLiteral(resourceName: "selected")
    let inactiveImage:UIImage = #imageLiteral(resourceName: "not-selected")
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
            self.pageIndicatorTintColor = UIColor.clear
            self.currentPageIndicatorTintColor = UIColor.clear
            self.clipsToBounds = false
        }

        func updateDots() {
            
            for (index,view) in self.subviews.enumerated() {
                var imageView = self.imageView(forSubview: view)
                if imageView == nil {
                    if index == 0 {
                        imageView = UIImageView(image: activeImage)
                    } else {
                        imageView = UIImageView(image: inactiveImage)
                    }
                    imageView!.center = view.center
                    view.addSubview(imageView!)
                    view.clipsToBounds = false
                }
            }
        }

        fileprivate func imageView(forSubview view: UIView) -> UIImageView? {
            var dot: UIImageView?
            if let dotImageView = view as? UIImageView {
                dot = dotImageView
            } else {
                for foundView in view.subviews {
                    if let imageView = foundView as? UIImageView {
                        dot = imageView
                        break
                    }
                }
            }
            return dot
        }
}
