//
//  ShoppingCardScreen.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 23.12.22.
//

import UIKit

class ShoppingCartScreen:UIViewController{
    var shoppingList = [ShoppingCart]()
    
    @IBOutlet weak var tableView: UITableView!
    var presenter:ViewToPresenterShoppingCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ShoppingCartRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        presenter?.getShoppingList(userName: "lola1998")
    }
    
}

extension ShoppingCartScreen:PresenterToViewShoppingCartProtocol{
    func returnShoppingList(shoppingList: [ShoppingCart]) {
        self.shoppingList = shoppingList
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func returnDeleteResponse(response: Bool) {
        
    }
    
    
    
}

extension ShoppingCartScreen:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,bool) in
            let item = self.shoppingList[indexPath.row]
            
            let alert = UIAlertController(title: "Deletion Process", message: "Do you want to delete \(item.name!) ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                let deleteProductRequest = DeleteFromCardRequest(cartId: item.cartId!, userName: item.userName!)
                print("yesAction")
                self.presenter?.deleteProductFromShoppingList(deleteFoodRequest: deleteProductRequest)
            }
    
            alert.addAction(yesAction)
            self.present(alert, animated: false)
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartItem = shoppingList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCartCell") as! CartTableViewCell
        
        cell.lblPrice.text = "\(cartItem.price!)$"
        cell.lblName.text = "\(cartItem.name!)"
        cell.lblAmount.text = "\(cartItem.orderAmount!)"
        if let url = URL(string: "http://kasimadalan.pe.hu/foods/images/\(cartItem.image!)")
        {
            DispatchQueue.main.async {
                cell.ivCartCell.kf.setImage(with: url)

            }
        }
        
        return cell
    }
}
