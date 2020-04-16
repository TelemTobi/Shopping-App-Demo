//
//  UILabel.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 14/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
        super.drawText(in: rect.inset(by: insets))
    }
}
