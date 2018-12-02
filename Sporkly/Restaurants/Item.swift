//
//  Item.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 12/1/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit

class ReusableItem: MenuCellPresentable {
    private var itemName: String
    private var imageName: String
    private var itemDetail: String
    private var itemPrice: Double
    private var itemCategory: String

    init(title: String, imageName: String, detail: String, price: Double, category: String) {
        self.itemName = title
        self.imageName = imageName
        self.itemDetail = detail
        self.itemPrice = price
        self.itemCategory = category
    }

    var title: String? {
        return itemName
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let itemImage = UIImage(named: imageName)
        return scaleUIImageToSize(image: itemImage ?? UIImage(), size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return itemDetail
    }

    var left: String? {
        return itemCategory
    }

    var right: String? {
        let price = String(itemPrice)
        return price
    }
}
