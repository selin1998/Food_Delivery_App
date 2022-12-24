//
//  ViewController.swift
//  FoodStore
//
//  Created by Selin Hebipoghlu on 17.12.22.
//

import UIKit

class EntranceScreen: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
    }
    func setUpElements(){
        Utilities.styleFilledButton(btnLogin)
        Utilities.styleFilledButton(btnSignUp)
    }


}

