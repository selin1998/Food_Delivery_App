//
//  MainProtocols.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 20.12.22.
//

import Foundation

protocol ViewToPresenterMainProtocol{
    var mainInteractor: PresenterToInteractorMainProtocol?{get set}
    var mainView: PresenterToViewMainProtocol?{get set}
    func fetchFood()
}

protocol PresenterToInteractorMainProtocol{
    var mainPresenter: InteractorToPresenterMainProtocol?{get set}
    func fetchFood()
}

protocol InteractorToPresenterMainProtocol{
    func sendToPresenter(foodList:[Food])
}

protocol PresenterToViewMainProtocol{
    func sendToView(foodList:[Food])
}

protocol PresenterToRouterMainProtocol{
    static func createModule(ref:MainScreen)
}
