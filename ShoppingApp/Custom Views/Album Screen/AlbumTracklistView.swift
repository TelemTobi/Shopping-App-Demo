//
//  AlbumTracklistView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 19/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumTracklistView: UIView {
    
    private var titleLabel: UILabel!
    private var arrowImage: UIImageView!
    
    private var titleCenterXAnchor: NSLayoutConstraint!
    
    init() {
        super.init(frame: .zero)
        
        setArrowImage()
        setTitieLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setArrowImage() {
        arrowImage = UIImageView(image: UIImage(named: "down-arrow"))
        arrowImage.contentMode = .scaleAspectFit
        arrowImage.alpha = 0.5
        addSubview(arrowImage)
        
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        arrowImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 4).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setTitieLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Tracklist"
        titleLabel.backgroundColor = .myBackgroundColor
        titleLabel.textColor = .lightGray
        titleLabel.font = .Jura(ofSize: 16, weight: "Medium")
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: arrowImage.topAnchor, constant: -2).isActive = true
        titleCenterXAnchor = titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        titleCenterXAnchor.isActive = true
    }
}
