//
//  FoodDetailPresenter.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation

class FoodDetailPresenter:ViewToPresenterFoodDetailProtocol{
    func addToShoppingList(shoppingItem: ShoppingCart) {
        interactor?.addToShoppingList(shoppingItem: shoppingItem)
    }
    
    var view: PresenterToViewFoodDetailProtocol?
    var interactor: PresenterToInteractorFoodDetailProtocol?
    
   
}

extension FoodDetailPresenter:InteractorToPresenterFoodDetailProtocol{
    func foodAddingResponse(response: String) {
        view?.foodAddingResponse(response: response)
    }
    
}
