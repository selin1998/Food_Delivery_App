//
//  MainPresenter.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 20.12.22.
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol{
    var mainView: PresenterToViewMainProtocol?
    var mainInteractor: PresenterToInteractorMainProtocol?
    
    func fetchFood() {
        mainInteractor?.fetchFood()
    }
    
}

extension MainPresenter: InteractorToPresenterMainProtocol{
    func sendToPresenter(foodList: [Food]) {
        mainView?.sendToView(foodList: foodList)
    }
}
