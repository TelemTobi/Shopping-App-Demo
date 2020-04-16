//
//  AlbumCell.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumTableCell: UITableViewCell {
    
    static let id = "AlbumTableViewCell"
    
    private var containerView: UIView!
    private var coverImage: UIImageView!
    private var titleLabel: UILabel!
    private var artistLabel: UILabel!
    
    var album: Album? {
        didSet {
            coverImage.image = album?.image
            titleLabel.text = album?.title
            artistLabel.text = album?.artist.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpElements()
        setContaienrView()
        setCoverImage()
        setTitleLabel()
        setArtistLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.backgroundColor = .myBackgroundColor
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
    }
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.font = .Jura(ofSize: 14, weight: "Medium")
        artistLabel.textColor = .myBackgroundColor
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, artistLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        containerView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 12).isActive = true
    }
}
