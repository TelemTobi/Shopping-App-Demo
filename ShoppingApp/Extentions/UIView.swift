//
//  UIView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 08/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
}
