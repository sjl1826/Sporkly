//
//  Menu.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation

struct Menu {
    var entrees: [MenuItem]
    var drinks: [MenuItem]
    var desserts: [MenuItem]
}

extension Menu: Decodable {
    enum MenuTypeKey: String, CodingKey {
        case entrees
        case drinks
        case desserts
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MenuTypeKey.self)
        var entreesList = try container.nestedUnkeyedContainer(forKey: MenuTypeKey.entrees)
        var items = [MenuItem]()
        while(!entreesList.isAtEnd) {
            let menuItem = try entreesList.decode(MenuItem.self)
            items.append(menuItem)
        }
        entrees = items
        items.removeAll()
        var drinksList = try container.nestedUnkeyedContainer(forKey: MenuTypeKey.drinks)
        while(!drinksList.isAtEnd) {
            let drinksItem = try drinksList.decode(MenuItem.self)
            items.append(drinksItem)
        }
        drinks = items
        items.removeAll()
        var dessertsList = try container.nestedUnkeyedContainer(forKey: MenuTypeKey.desserts)
        while(!dessertsList.isAtEnd) {
            let dessertItem = try dessertsList.decode(MenuItem.self)
            items.append(dessertItem)
        }
        desserts = items
        items.removeAll()
    }
}

struct MenuItem {
    var name: String
    var price: String
    var picture: String
    var keywords: String
    var description: String
    var category: String
}

extension MenuItem: Decodable {
    enum ItemKeys: String, CodingKey {
        case name
        case price
        case picture
        case keywords
        case description
        case category
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemKeys.self)
        category = try container.decode(String.self, forKey: .category)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(String.self, forKey: .price)
        picture = try container.decode(String.self, forKey: .picture)
        keywords = try container.decode(String.self, forKey: .keywords)
        description = try container.decode(String.self, forKey: .description)
    }
}

