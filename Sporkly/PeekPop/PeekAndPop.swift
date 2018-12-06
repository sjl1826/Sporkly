//
//  PeekAndPop.swift
//  Sporkly
//
//  Created by SHIRLY Fang on 12/4/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit

class PeekAndPop : UIViewController  {
    
    @IBAction func addItem(_ sender: Any) {
        Plate.plateArray.append(item!)
    }
   
    @IBOutlet weak var decriptionLabel: UILabel!
    @IBOutlet weak var bottom: UIView!
    @IBOutlet weak var container: UIView!
    var descriptionText : String?
    var item : MenuCellPresentable? 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decriptionLabel.text = descriptionText
    }
    override func viewDidLayoutSubviews() {
        container.layer.masksToBounds = false
        container.layer.shadowRadius = 5
        container.layer.shadowOpacity = 0.8
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.cornerRadius = 10
        container.layer.borderColor = UIColor.red.cgColor
        container.layer.borderWidth = 2
        container.clipsToBounds = true 
        bottom.layer.masksToBounds = false
        bottom.clipsToBounds = true 
    }
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
