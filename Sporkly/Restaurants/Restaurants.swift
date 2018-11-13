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
        return UIImage(named: "cheese")
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Fullerton, CA"
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
        return UIImage(named: "burger")
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Anaheim, CA"
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
        return UIImage(named: "steak")
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Los Angeles, CA"
    }
}

class ChineseCuisine: MenuCellPresentable {
    var title: String? {
        return "   Boiling Crab"
    }

    var backgroundColor: UIColor {
        return UIColor.white
    }

    var icon: UIImage? {
        return UIImage(named: "chinese")
    }

    var detailColor: UIColor {
        return UIColor.gray
    }

    var detail: String? {
        return "Westwood, CA"
    }
}
