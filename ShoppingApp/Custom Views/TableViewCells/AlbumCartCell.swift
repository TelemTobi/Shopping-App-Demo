//
//  AlbumCartCell.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 19/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumCartCell: UITableViewCell {
    
    static let id = "AlbumCartCell"
    
    private var containerView: UIView!
    private var coverImage: UIImageView!
    private var titleLabel: UILabel!
    private var artistLabel: UILabel!
    private var priceLabel: UILabel!
    private var removeButton: UIButton!
    
    var delegate: CartDelegate!
    
    var album: Album? {
        didSet {
            coverImage.image = album?.image
            titleLabel.text = album?.title
            artistLabel.text = demoArtists[album?.artist ?? ""]?.name ?? testArtist.name
            priceLabel.text = "$\(album?.price.description ?? "15.0")0"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .myBackgroundColor
        
        setContaienrView()
        setCoverImage()
        setPriceLabel()
        setTitleLabel()
        setArtistLabel()
        setRemoceButton()
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
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -28).isActive = true
    }
    
    private func setCoverImage() {
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFit
        coverImage.layer.borderColor = UIColor.myBackgroundColor.cgColor
        coverImage.layer.borderWidth = 1
        addSubview(coverImage)
        
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        coverImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -20).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setPriceLabel() {
        priceLabel = UILabel()
        priceLabel.textAlignment = .center
        priceLabel.font = .Jura(ofSize: 16, weight: "Medium")
        priceLabel.textColor = .myBackgroundColor
        priceLabel.layer.borderColor = UIColor.myBackgroundColor.cgColor
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.cornerRadius = 5
        containerView.addSubview(priceLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.font = .Jura(ofSize: 16, weight: "Bold")
        titleLabel.textColor = .myBackgroundColor
    }
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.font = .Jura(ofSize: 12, weight: "Medium")
        artistLabel.textColor = .myBackgroundColor
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, artistLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        containerView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -4).isActive = true
    }
    
    private func setRemoceButton() {
        removeButton = UIButton(type: .custom)
        removeButton.tintColor = .myBackgroundColor
        removeButton.backgroundColor = .none
        removeButton.setImage(UIImage(systemName: "trash"), for: .normal)
        removeButton.setImage(UIImage(systemName: "trash.fill"), for: .highlighted)
        removeButton.imageView?.contentMode = .scaleAspectFit
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        containerView.addSubview(removeButton)
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4).isActive = true
        removeButton.centerXAnchor.constraint(equalTo: priceLabel.centerXAnchor).isActive = true
        removeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc private func removeButtonTapped() {
        guard let id = album?.id else { return }
        delegate.removeItemFromCart(id: id)
    }
}
