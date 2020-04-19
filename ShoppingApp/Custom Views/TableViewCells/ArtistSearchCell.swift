//
//  ArtistCell.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ArtistSearchCell: UITableViewCell {
    
    static let id = "ArtistTableViewCell"
    
    private var containerView: UIView!
    private var coverImage: UIImageView!
    private var titleLabel: UILabel!
    
    var artist: Artist? {
        didSet {
            coverImage.image = artist?.image
            titleLabel.text = artist?.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .myBackgroundColor
        
        setContaienrView()
        setCoverImage()
        setTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContaienrView() {
        containerView = UIView()
        containerView.backgroundColor = .primaryColor
        containerView.layer.cornerRadius = 15
        contentView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
    }
    
    private func setCoverImage() {
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFit
        coverImage.layer.cornerRadius = 25
        coverImage.layer.masksToBounds = true
        coverImage.layer.borderColor = UIColor.myBackgroundColor.cgColor
        coverImage.layer.borderWidth = 1
        coverImage.backgroundColor = .secondaryColor // remove in future
        containerView.addSubview(coverImage)
        
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        coverImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = .Jura(ofSize: 18, weight: "Bold")
        titleLabel.textColor = .myBackgroundColor
        titleLabel.text = "Artist name" // remove in future
        containerView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 12).isActive = true
    }
}
