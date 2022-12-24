//
//  ShoppingCardInteractor.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation
import Alamofire

class ShoppingCartInteractor:PresenterToInteractorShoppingCartProtocol{
   
    var presenter: InteractorToPresenterShoppingCartProtocol?
    
    func deleteProductFromShoppingList(deleteFoodRequest: DeleteFromCardRequest) {
        
        
        
        let params: Parameters = ["cartId": deleteFoodRequest.cartId!, "userName": deleteFoodRequest.userName!]
        
        print(params)
        
        AF.request("http://kasimadalan.pe.hu/foods/deleteFood.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    print("success from delete food")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
//
//        guard let parameters = deleteFoodRequest.getParameter() else {
//            return
//        }
//        print(parameters)
//        AF.request("http://kasimadalan.pe.hu/foods/deleteFood.php", method: .post, parameters: parameters).response { data in
//            guard let response = data.response else{
//                self.presenter?.returnDeleteResponse(response: false)
//                print("success deletion")
//                return
//            }
//            if response.statusCode>300 || response.statusCode<200 {
//                self.presenter?.returnDeleteResponse(response: false)
//                print("error")
//            }
//            self.presenter?.returnDeleteResponse(response: true)
//        }
    }
    
    func getShoppingList(userName: String) {
        let parameter:Parameters = ["userName":"lola1998"]
        AF.request("http://kasimadalan.pe.hu/foods/getFoodsCart.php", method: .post, parameters: parameter).response {
            response in
            if let data = response.data{
                print(data)
                do{
                    let r = try JSONDecoder().decode(ShoppingCartResponse.self, from: data)
                    print(r)
                    if let food_items = r.foodsCart{
                        for i in food_items{
                            print(i.cartId)
                            print(i.orderAmount)
                            print(i.price)
                            print(i.userName)
                        }
                                
                        self.presenter?.returnShoppingList(shoppingList: food_items)
                    }
                }
                catch{
                    print(error)
                }
            }
        }
    }
    
    
}
