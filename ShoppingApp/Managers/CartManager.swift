//
//  CartManager.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 22/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit
import SwiftEntryKit

var cartItems: [String]!

class CartManager {
    
    static let shared = CartManager()
    private init(){}
    
    var totalPrice: Float {
        var total: Float = 0
        cartItems.forEach {
            total += demoAlbums[$0]?.price ?? 0.0
        }
        return total
    }
    
    func importCartItems() {
        cartItems = UserDefaults.standard.array(forKey: "cartItems") as? [String] ?? []
        print(cartItems ?? "Nil")
    }
    
    func saveCartItems() {
        UserDefaults.standard.set(cartItems, forKey: "cartItems")
    }
    
    func addItemToCart(_ id: String) {
        cartItems.append(id)
    }
    
}
