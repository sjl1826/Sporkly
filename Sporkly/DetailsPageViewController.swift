//
//  DetailsPageViewController.swift
//  Sporkly
//
//  Created by SHIRLY Fang on 11/17/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit
class DetailsPageViewController: UIViewController {
    @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    var entrees = [MenuItem]()
    var desserts = [MenuItem]()
    var drinks = [MenuItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            API.getMenu { (menuItems) in
                print("Successfully completed request")
                for item in menuItems.entrees {
                    print("Name: \(item.name)")
                    print("Price: \(item.price)")
                    print("Picture?: \(item.picture)")
                    print("Description: \(item.description)")
                    print("Keywords: \(item.keywords)")
                    self.entrees.append(item)
                }
                for item in menuItems.drinks {
                    print("Name: \(item.name)")
                    print("Price: \(item.price)")
                    print("Picture?: \(item.picture)")
                    print("Description: \(item.description)")
                    print("Keywords: \(item.keywords)")
                    self.drinks.append(item)
                }
                for item in menuItems.desserts {
                    print("Name: \(item.name)")
                    print("Price: \(item.price)")
                    print("Picture?: \(item.picture)")
                    print("Description: \(item.description)")
                    print("Keywords: \(item.keywords)")
                    self.desserts.append(item)
                }
                self.foodName.text = self.desserts[0].name
                self.foodDescription.text = self.desserts[0].description
                self.foodPrice.text = String(self.desserts[0].price)
                let name = self.foodName.text?.split(separator: " ")
                let combined = name?.joined(separator: "")
                let both = "CCF_" + combined!
                self.foodPic.image = UIImage(named: both)
                
            }
        }

    }
    
    
}
