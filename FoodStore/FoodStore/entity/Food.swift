//
//  Food.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 19.12.22.
//

import Foundation

class Food:Codable{
    init(id: Int, name: String, image: String, price: Int, category: String) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.category = category
    }
    
    var id: Int?
    var name: String?
    var image: String?
    var price: Int?
    var category: String?
}
