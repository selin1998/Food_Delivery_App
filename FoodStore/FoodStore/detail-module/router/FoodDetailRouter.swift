//
//  FoodDetailRouter.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import Foundation

class FoodDetailRouter:PresenterToRouterFoodDetailProtocol{
    static func createModule(ref: FoodDetailScreen) {
        let presenter = FoodDetailPresenter()
        ref.presenter = presenter
        ref.presenter?.interactor = FoodDetailInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
