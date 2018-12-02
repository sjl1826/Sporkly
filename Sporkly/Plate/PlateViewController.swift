//
//  PlateViewController.swift
//  Sporkly
//
//  Created by SHIRLY Fang on 12/1/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit

class PlateViewController: UIViewController, Plateable, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var plateTable: UITableView!  {
        didSet {
            plateTable.registerNib(forCellType: MenuCell.self)
        }
    }

    var plateList = [MenuCellPresentable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        plateTable.delegate = self
        plateTable.dataSource = self
        plateTable.reloadWithAnimation()
        container.layer.masksToBounds = false
        container.layer.shadowRadius = 5
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.shadowOpacity = 0.7
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func addPlate(item: MenuCellPresentable) {
        plateList.append(item)
        plateTable.reloadWithAnimation()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Plate.plateArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: MenuCell.self, for: indexPath)
        cell.item = Plate.plateArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

protocol Plateable {
    func addPlate(item: MenuCellPresentable)
}
