//
//  ShoppingCardResponse.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 22.12.22.
//

import Foundation

class ShoppingCartResponse:Codable{
   
    var foodsCart: [ShoppingCart]?
    
    enum CodingKeys: String, CodingKey {
        case foodsCart = "foods_cart"
    }
}
