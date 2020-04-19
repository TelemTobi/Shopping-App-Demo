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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .myBackgroundColor
        tableView.separatorStyle = .none
        
        tableView.register(AlbumCartCell.self, forCellReuseIdentifier: AlbumCartCell.id)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCartCell.id, for: indexPath) as! AlbumCartCell
        cell.album = testAlbum
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectAlbum(nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}
