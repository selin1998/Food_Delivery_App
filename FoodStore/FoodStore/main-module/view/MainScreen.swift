//
//  MainController.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 19.12.22.
//

import UIKit
import Kingfisher

class MainScreen: UIViewController {
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var foodList = [Food]()
    var mainPresenterObject: ViewToPresenterMainProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Define Layout here
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        //Get device width
        let width = UIScreen.main.bounds.width

        //set section inset as per your requirement.
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        //set cell item size here
        layout.itemSize = CGSize(width: width / 8, height: width / 8)

        //set Minimum spacing between 2 items
        layout.minimumInteritemSpacing = 20

        //set minimum vertical line spacing here between two lines in collectionview
        layout.minimumLineSpacing = 20

        //apply defined layout to collectionview
        foodCollectionView.collectionViewLayout = layout
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        MainRouter.createModule(ref: self)
        
        mainPresenterObject?.fetchFood()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let food = sender as? Food {
                let detailScreen = segue.destination as! FoodDetailScreen
                detailScreen.food_item = food
            }
        }
    }
    

}

extension MainScreen : PresenterToViewMainProtocol {
    func sendToView(foodList: [Food]) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.foodCollectionView.reloadData()
        }
    }
}

extension MainScreen: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foodList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell" , for: indexPath) as! FoodTableCollectionViewCell
        
        cell.lblName.text = food.name!
        cell.lblPrice.text = String(food.price!)
        
        if let url = URL(string: "http://kasimadalan.pe.hu/foods/images/\(food.image!)")
        {
            DispatchQueue.main.async {
                cell.ivFood.kf.setImage(with: url)

            }
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food_item = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food_item)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
}



extension MainScreen: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}
