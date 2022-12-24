//
//  FoodDetailInteractor.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation
import Alamofire

class FoodDetailInteractor:PresenterToInteractorFoodDetailProtocol{
    var presenter: InteractorToPresenterFoodDetailProtocol?
    
    func addToShoppingList(shoppingItem:ShoppingCart) {
        
        let params: Parameters = [
            "name": shoppingItem.name!,
            "image": shoppingItem.image!,
            "price": shoppingItem.price!,
            "category": shoppingItem.category!,
            "orderAmount": shoppingItem.orderAmount!,
            "userName": shoppingItem.userName!]
        
        print(params)
        
        AF.request("http://kasimadalan.pe.hu/foods/insertFood.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    print("success from post food")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}
