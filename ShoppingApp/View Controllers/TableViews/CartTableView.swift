//
//  CartTableView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 19/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class CartTableView: UITableViewController {
    
    var delegate: AlbumDelegate?
    var cartDelegate: CartDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .myBackgroundColor
        tableView.separatorStyle = .none
        
        tableView.register(AlbumCartCell.self, forCellReuseIdentifier: AlbumCartCell.id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCartCell.id, for: indexPath) as! AlbumCartCell
        cell.delegate = self
        cell.album = demoAlbums[cartItems[indexPath.row]] ?? testAlbum
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectAlbum(demoAlbums[cartItems[indexPath.row]] ?? testAlbum)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}

extension CartTableView: CartDelegate {
    
    func removeItemFromCart(id: String) {
        guard let index = cartItems.firstIndex(of: id) else { return }
        cartItems.remove(at: index)
        cartDelegate?.removeItemFromCart(id: id)
    }
}
