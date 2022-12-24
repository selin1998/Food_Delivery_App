//
//  ShoppingCardPresenter.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation

class ShoppingCartPresenter:ViewToPresenterShoppingCartProtocol{
    var interactor: PresenterToInteractorShoppingCartProtocol?
    
    var view: PresenterToViewShoppingCartProtocol?
    
    func deleteProductFromShoppingList(deleteFoodRequest: DeleteFromCardRequest) {
        interactor?.deleteProductFromShoppingList(deleteFoodRequest: deleteFoodRequest)
    }
    
    func getShoppingList(userName: String) {
        interactor?.getShoppingList(userName: userName )
    }
    
    
}

extension ShoppingCartPresenter:InteractorToPresenterShoppingCartProtocol{
    func returnDeleteResponse(response: Bool) {
        view?.returnDeleteResponse(response: response)
    }
    
    func returnShoppingList(shoppingList: [ShoppingCart]) {
        view?.returnShoppingList(shoppingList: shoppingList)
    }
}
