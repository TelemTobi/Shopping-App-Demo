//
//  UIFont.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 06/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func MandatoryPlaything(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "MandatoryPlaything", size: size)!
    }
    
    static func Jura(ofSize size: CGFloat, weight: String) -> UIFont {
        return UIFont(name: "Jura-\(weight)", size: size)!
    }
}
