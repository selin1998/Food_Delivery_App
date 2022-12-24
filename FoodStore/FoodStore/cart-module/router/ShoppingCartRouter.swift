//
//  ShoppingCardRouter.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation

class ShoppingCartRouter:PresenterToRouterShoppingCartProtocol{
    static func createModule(ref: ShoppingCartScreen) {
        let presenter = ShoppingCartPresenter()
        
        ref.presenter = presenter
        ref.presenter?.interactor = ShoppingCartInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}

