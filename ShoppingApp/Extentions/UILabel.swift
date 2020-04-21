//
//  UILabel.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 14/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

extension UILabel {
    
    func outline() {
        let attrString = NSAttributedString(string: text ?? "", attributes: [NSAttributedString.Key.strokeColor: UIColor.primaryColor, NSAttributedString.Key.foregroundColor: UIColor.myBackgroundColor, NSAttributedString.Key.strokeWidth: -2.0])
        attributedText = attrString
    }
}
