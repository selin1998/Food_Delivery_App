//
//  MainInteractor.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 20.12.22.
//

import Foundation
import Alamofire

class MainInteractor: PresenterToInteractorMainProtocol{
    
    
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    func fetchFood() {
        print("interactor")
        
        AF.request("http://kasimadalan.pe.hu/foods/getAllFoods.php", method: .get).response{
            response in
            if let data = response.data{
                do{
                    let r = try JSONDecoder().decode(FoodResponse.self, from: data)
                    
                    if let items = r.foods{
                        self.mainPresenter?.sendToPresenter(foodList: items)
                        for item in items{
                            print("name \(item.name!)")
                        }
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}
