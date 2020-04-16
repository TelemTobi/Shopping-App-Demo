//
//  ShopSectionHeader.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 09/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SearchSectionHeader:  UITableViewHeaderFooterView {
    
    static let id = "SearchSectionHeader"
    private var titleLabel: UILabel!
    
    var title: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpElements()
        setUpTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        contentView.backgroundColor = .myBackgroundColor
    }
    
    func setUpTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = .Jura(ofSize: 24, weight: "Bold")
        titleLabel.contentMode = .bottomLeft
        titleLabel.textColor = .primaryColor
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
    }
}

