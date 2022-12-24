//
//  DeleteFromCardRequest.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 22.12.22.
//

import Foundation
import Alamofire

class DeleteFromCardRequest:Codable{
    init(cartId: Int, userName: String) {
        self.cartId = cartId
        self.userName = userName
    }
    
    var cartId:Int?
    var userName:String?
    
    
    func getParameter()->Parameters?{
        if let cartId = cartId, let userName = userDefaults.string(forKey: "lola1998") {
            return ["cartId":cartId,"userName":userName]
        }
        
        return nil
    }
}
