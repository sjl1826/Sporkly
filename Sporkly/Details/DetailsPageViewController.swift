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

    var foodPicText = String()
    var foodNameText = String()
    var foodDescriptionText = String()
    var foodPriceText = String()
    var item : MenuCellPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodName.text = self.foodNameText
        self.foodDescription.text = self.foodDescriptionText
        self.foodPrice.text = self.foodPriceText
        if let pic = UIImage(named: self.foodNameText) {
            print(pic) //temporarily silencing warning
            foodPicText = self.foodNameText
        } else {
            foodPicText = "NoPictureIcon"
        }
        self.foodPic.image = UIImage(named:foodPicText)
    }

    @IBAction func backToList(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func addToPlate(_ sender: Any) {
        let plateBoard = UIStoryboard(name: "Plate", bundle: nil)
        let plate = plateBoard.instantiateViewController(withIdentifier: "PlateViewController") as! PlateViewController
        plate.view.backgroundColor = UIColor.clear
        plate.modalPresentationStyle = .overCurrentContext
        Plate.plateArray.append(item!)
        self.present(plate, animated: true, completion: nil)
    }
}
