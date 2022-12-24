//
//  ShoppingCardRequest.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 22.12.22.
//

import Foundation
import Alamofire

class ShoppingCart:Codable{
    
    var cartId: Int?
    var name: String?
    var image: String?
    var price: Int?
    var category: String?
    var orderAmount: Int?
    var userName: String?
    
    init(cartId: Int, name: String, image: String, price: Int, category: String, orderAmount: Int, userName:String) {
        self.cartId = cartId
        self.name = name
        self.image = image
        self.price = price
        self.category = category
        self.orderAmount = orderAmount
        self.userName = userName
    }
    
    func getParameter()->Parameters?{
        if let name = name, let userName = userDefaults.string(forKey: "tst_usr"), let image = image,
        let price = price, let category = category, let orderAmount = orderAmount
        {
            return ["image":image,"userName":userName, "name": name, "price":price, "category": category, "orderAmount": orderAmount ]
        }
        
        return nil
    }
    
    
}
