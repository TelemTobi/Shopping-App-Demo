//
//  GenreCell.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 08/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    static let id = "GenreCollectionViewCell"
    
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    private var bottomLine: UIView!
    
    var genre: (String, UIImage)! {
        willSet {
            imageView.image = newValue.1
            titleLabel.text = newValue.0
        }
    }
    
    override var isSelected: Bool {
        willSet{
            super.isSelected = newValue
            UIView.animate(withDuration: 0.3) {
                self.bottomLine.alpha = newValue ? 1 : 0
                self.titleLabel.textColor = newValue ? .secondaryColor : .primaryColor
                self.titleLabel.font = newValue ? .Jura(ofSize: 15, weight: "Bold") : .Jura(ofSize: 14, weight: "Medium")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpElements()
        setImageView()
        setTitle()
        setBottomLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.backgroundColor = .myBackgroundColor
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.primaryColor.cgColor
    }
    
    private func setImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setTitle() {
        titleLabel = UILabel()
        titleLabel.font = .Jura(ofSize: 14, weight: "Medium")
        titleLabel.textColor = .primaryColor
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func setBottomLine() {
        bottomLine = UIView()
        bottomLine.backgroundColor = .secondaryColor
        bottomLine.alpha = 0
        contentView.addSubview(bottomLine)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
}
