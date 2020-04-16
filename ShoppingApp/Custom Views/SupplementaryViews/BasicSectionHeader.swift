//
//  BasicSectionHeader.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 16/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class BasicSectionHeader: UICollectionReusableView {
    
    static let id = "BasicSectionHeader"
    private var titleLabel: UILabel!
    
    var title: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
        setUpTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        backgroundColor = .myBackgroundColor
    }
    
    func setUpTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = .Jura(ofSize: 20, weight: "Bold")
        titleLabel.contentMode = .bottomLeft
        titleLabel.textColor = .primaryColor
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

