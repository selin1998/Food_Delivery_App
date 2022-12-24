//
//  FoodDetailProtocols.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol{
    var interactor:PresenterToInteractorFoodDetailProtocol? {get set}
    var view:PresenterToViewFoodDetailProtocol? {get set}
    func addToShoppingList(shoppingItem: ShoppingCart)
}

protocol PresenterToInteractorFoodDetailProtocol{
    var presenter:InteractorToPresenterFoodDetailProtocol? {get set}
    func addToShoppingList(shoppingItem: ShoppingCart)
}

protocol InteractorToPresenterFoodDetailProtocol{
    func foodAddingResponse(response:String)
}

protocol PresenterToViewFoodDetailProtocol{
    func foodAddingResponse(response:String)
}

protocol PresenterToRouterFoodDetailProtocol{
    static func createModule(ref:FoodDetailScreen)
}
