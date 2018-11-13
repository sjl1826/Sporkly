//
//  TestViewController.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitRequest(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {
            API.getMenu { (menuItems) in
                print("Successfully completed request")
                for item in menuItems.entrees {
                    print("Name: \(item.name)")
                    print("Price: \(item.price)")
                    print("Picture?: \(item.picture)")
                    print("Description: \(item.description)")
                    print("Keywords: \(item.keywords)")
                }
                for item in menuItems.drinks {
                    print("Name: \(item.name)")
                    print("Price: \(item.price)")
                    print("Picture?: \(item.picture)")
                    print("Description: \(item.description)")
                    print("Keywords: \(item.keywords)")
                }
                for item in menuItems.desserts {
                    print("Name: \(item.name)")
                    print("Price: \(item.price)")
                    print("Picture?: \(item.picture)")
                    print("Description: \(item.description)")
                    print("Keywords: \(item.keywords)")
                }
            }
        }
    }
}
