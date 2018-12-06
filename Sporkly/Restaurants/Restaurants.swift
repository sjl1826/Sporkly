//
//  Restaurants.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit

class Restaurants {
    static var defaultRestaurants: [MenuCellPresentable] {
        var restaurants: [MenuCellPresentable] = []
        restaurants.append(CheesecakeFactory())
        restaurants.append(BJs())
        restaurants.append(McDonalds())
        restaurants.append(BobsBurgers())
        restaurants.append(ChefBills())
        restaurants.append(ChineseCuisine())
        return restaurants
    }
}

class CheesecakeFactory: MenuCellPresentable {
    var title: String? {
        return "   The Cheesecake Factory"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let image = UIImage(named: "cheese") ?? UIImage()
        return scaleUIImageToSize(image: image, size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Fullerton, CA"
    }

    var left: String? {
        return "Pastas"
    }

    var right: String? {
        return "$$"
    }
}

class BobsBurgers: MenuCellPresentable {
    var title: String? {
        return "   Bob's Burgers"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let image = UIImage(named: "burger") ?? UIImage()
        return scaleUIImageToSize(image: image, size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Anaheim, CA"
    }

    var left: String? {
        return "Burgers"
    }

    var right: String? {
        return "$"
    }
}

class ChefBills: MenuCellPresentable {
    var title: String? {
        return "   Chef Bill's"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let image = UIImage(named: "steak") ?? UIImage()
        return scaleUIImageToSize(image: image, size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Los Angeles, CA"
    }

    var left: String? {
        return "Steak"
    }

    var right: String? {
        return "$$$"
    }
}

class ChineseCuisine: MenuCellPresentable {
    var title: String? {
        return "   Uncle Chen's"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let image = UIImage(named: "chinese") ?? UIImage()
        return scaleUIImageToSize(image: image, size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Westwood, CA"
    }

    var left: String? {
        return "Asian"
    }

    var right: String? {
        return "$$"
    }
}

class McDonalds: MenuCellPresentable {
    var title: String? {
        return "   McDonalds"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let image = UIImage(named: "mcdonald") ?? UIImage()
        return scaleUIImageToSize(image: image, size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Westwood, CA"
    }

    var left: String? {
        return "Fast Food"
    }

    var right: String? {
        return "$"
    }
}

class BJs: MenuCellPresentable {
    var title: String? {
        return "   BJ's"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        let image = UIImage(named: "bjs") ?? UIImage()
        return scaleUIImageToSize(image: image, size: CGSize(width: 75, height: 75))
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Westwood, CA"
    }

    var left: String? {
        return "American"
    }

    var right: String? {
        return "$$"
    }
}
