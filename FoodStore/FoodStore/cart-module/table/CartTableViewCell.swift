//
//  CartTableViewCell.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 24.12.22.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivCartCell: UIImageView!
    var shoppingCart:ShoppingCart?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
