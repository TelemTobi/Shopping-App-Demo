//
//  UISearchBar.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    func setTextAttributes() {
        // SearchBar text
        let textFieldInsideUISearchBar = value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = .primaryColor
        textFieldInsideUISearchBar?.font = .Jura(ofSize: 16, weight: "Medium")

        // SearchBar placeholder
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.font = .Jura(ofSize: 16, weight: "Medium")
        
        let leftImageView = textFieldInsideUISearchBar!.value(forKey: "leftView") as? UIView
        leftImageView?.tintColor = .primaryColor
    }
}
