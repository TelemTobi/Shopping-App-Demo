//
//  TrackCell.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 16/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    static let id = "TrackCollectionViewCell"
    
    var indexLabel: UILabel!
    private var titleLabel: UILabel!
    private var durationLabel: UILabel!
    private var seperatorView: UIView!
    
    var track: Track? {
        didSet {
            titleLabel.text = track?.title
            durationLabel.text = track?.duration
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
        setIndexLabel()
        setDurationLabel()
        setTitleLabel()
        setSeperator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.backgroundColor = .myBackgroundColor
    }
    
    private func setIndexLabel() {
        indexLabel = UILabel()
        indexLabel.font = .Jura(ofSize: 12, weight: "Bold")
        indexLabel.textColor = .lightGray
        contentView.addSubview(indexLabel)
        
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        indexLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func setDurationLabel() {
        durationLabel = UILabel()
        durationLabel.font = .Jura(ofSize: 12, weight: "Bold")
        durationLabel.textColor = .lightGray
        contentView.addSubview(durationLabel)
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        durationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = .Jura(ofSize: 16, weight: "Medium")
        titleLabel.textColor = .primaryColor
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: indexLabel.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: durationLabel.leadingAnchor, constant: -8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func setSeperator() {
        seperatorView = UIView()
        seperatorView.backgroundColor = .primaryColor
        contentView.addSubview(seperatorView)
        
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func handleSeperator(shouldHide: Bool) {
        seperatorView.isHidden = shouldHide
    }
}
