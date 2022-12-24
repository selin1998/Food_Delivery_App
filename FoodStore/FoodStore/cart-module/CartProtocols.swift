//
//  CardProtocols.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 22.12.22.
//

import Foundation


protocol ViewToPresenterShoppingCartProtocol{
    var interactor:PresenterToInteractorShoppingCartProtocol? {get set}
    var view:PresenterToViewShoppingCartProtocol? {get set}
    func deleteProductFromShoppingList(deleteFoodRequest: DeleteFromCardRequest)
    
    func getShoppingList(userName:String)
    
}

protocol PresenterToInteractorShoppingCartProtocol{
    var presenter:InteractorToPresenterShoppingCartProtocol? {get set}
    
    func deleteProductFromShoppingList(deleteFoodRequest: DeleteFromCardRequest)
    
    func getShoppingList(userName:String)
}

protocol InteractorToPresenterShoppingCartProtocol{
    func returnShoppingList(shoppingList:[ShoppingCart])
    func returnDeleteResponse(response:Bool)
}

protocol PresenterToViewShoppingCartProtocol{
    func returnShoppingList(shoppingList:[ShoppingCart])
    func returnDeleteResponse(response:Bool)
}

protocol PresenterToRouterShoppingCartProtocol{
    static func createModule(ref:ShoppingCartScreen)
}
