//
//  UnderlineLabel.swift
//  ASMIO
//
//  Created by Mostafa Samir on 21/11/2021.
//
import UIKit

class UnderlinedLabel: UILabel {
    override var text: String? {
        didSet {
            setLabelText()
        }
    }
    
    private func setLabelText() {
        guard let text = text else { return }
        let textRange = NSRange(location: 0, length: text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        self.attributedText = attributedText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabelText()
    }
}
