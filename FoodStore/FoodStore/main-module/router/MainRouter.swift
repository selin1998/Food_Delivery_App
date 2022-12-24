//
//  MainRouter.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 20.12.22.
//

import Foundation

class MainRouter: PresenterToRouterMainProtocol{
    
    static func createModule(ref: MainScreen) {
        let presenter = MainPresenter()
        
        //View
        ref.mainPresenterObject = presenter
        
        //Presenter
        ref.mainPresenterObject?.mainInteractor = MainInteractor()
        ref.mainPresenterObject?.mainView = ref
        
        //Interactor
        ref.mainPresenterObject?.mainInteractor?.mainPresenter = presenter
    }
}
