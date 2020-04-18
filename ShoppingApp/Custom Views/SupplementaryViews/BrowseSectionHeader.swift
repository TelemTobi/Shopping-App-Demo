//
//  ShopSectionHeader.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 09/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class BrowseSectionHeader: UICollectionReusableView {
    
    static let id = "BrowseSectionHeader"
    private var titleLabel: UILabel!
    private var viewAllButton: UIButton!
    
    var title: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
        setUpTitleLabel()
        setViewAllButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        backgroundColor = .myBackgroundColor
    }
    
    func setUpTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = .Jura(ofSize: 24, weight: "Bold")
        titleLabel.contentMode = .bottomLeft
        titleLabel.textColor = .primaryColor
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func setViewAllButton() {
        viewAllButton = UIButton(type: .custom)
        viewAllButton.backgroundColor = .none
        viewAllButton.setImage(UIImage(named: "arrows"), for: .normal)
        viewAllButton.imageView?.contentMode = .scaleAspectFit
        addSubview(viewAllButton)
        
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        viewAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 2).isActive = true
        viewAllButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        viewAllButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

