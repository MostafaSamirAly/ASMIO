//
//  SelfSizedTableView.swift
//  ASMIO
//
//  Created by Mostafa Samir on 18/11/21.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

import UIKit


class SelfSizedTableView: UITableView {
    
    @IBInspectable var hasEmptyHeight:Bool = false
    override var intrinsicContentSize: CGSize {
        if isHidden {
            return .zero
        }else {
            if hasEmptyHeight && self.contentSize.height == 0 {
                return CGSize(width: self.frame.width, height: 200)
            }else {
                return self.contentSize
            }
        }
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
}
