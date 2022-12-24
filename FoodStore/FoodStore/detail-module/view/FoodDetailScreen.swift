//
//  FoodDetailScreen.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import UIKit
import Kingfisher

class FoodDetailScreen:UIViewController{
    var presenter:ViewToPresenterFoodDetailProtocol?
    var food_item:Food?
    
    
    @IBOutlet weak var ivFood: UIImageView!
    
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
   
    @IBAction func btnDcr(_ sender: Any) {
        print(counter.text!)
        guard let text = counter.text else {
            return
        }
        guard let amount = Int(text) else {
            return
        }
        if amount > 1 {
            counter.text = "\(amount - 1)"
            if let food = self.food_item {
                lblTotalPrice.text = "$\((amount - 1) * food.price!)"
            }
        }
    }
    
    @IBAction func btnIncr(_ sender: Any) {
        print(counter.text!)
        guard let text = counter.text else {
            return
        }
        guard let amount = Int(text) else {
            return
        }
        if amount >= 1 {
            counter.text = "\(amount + 1)"
            if let food = self.food_item {
                lblTotalPrice.text = "$\((amount + 1) * food.price!)"
            }
        }
    }
    
    @IBAction func btnAddToShoppingCart(_ sender: Any) {
        
        if let food = food_item,let totalAmountText = counter.text, let totalAmount = Int(totalAmountText), totalAmount != 0 {
            let shoppingItem = ShoppingCart(cartId: 10, name: food.name!, image: food.image!, price: food.price!, category: food.category!, orderAmount: Int(totalAmount), userName: "lola1998")
            presenter?.addToShoppingList(shoppingItem:shoppingItem)
            
              }else{
                  
              }
    }
    
    
    override func viewDidLoad() {
        FoodDetailRouter.createModule(ref: self)
        if let food = food_item {
            counter.text = "1"
            lblName.text = food.name
            lblCategory.text = food.category
            lblTotalPrice.text = "$\(food.price!)"
            if let url = URL(string: "http://kasimadalan.pe.hu/foods/images/\(food.image!)")
            {
                DispatchQueue.main.async {
                    self.ivFood.kf.setImage(with: url)

                }
            }
        }
    }
    
}

extension FoodDetailScreen:PresenterToViewFoodDetailProtocol{
    func foodAddingResponse(response: String) {
        
    }
}
