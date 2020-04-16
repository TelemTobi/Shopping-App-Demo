//
//  UIViewController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setAlbumController() -> AlbumController {
        let albumController = AlbumController()
        albumController.view.isHidden = true
        
        addChild(albumController)
        albumController.didMove(toParent: self)
        view.addSubview(albumController.view)
        
        view.constraintToBounds(albumController.view)
        return albumController
    }
    
    func dismissKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
        
    @objc private func backgroundTapped(_ sender: UITapGestureRecognizer) {
        if sender.view is UICollectionViewCell { return }
        view.endEditing(true)
    }
    
}
