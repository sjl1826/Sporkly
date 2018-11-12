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
}

extension Menu: Decodable {
    enum MenuTypeKey: String, CodingKey {
        case entrees
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
    }
}

struct MenuItem {
    var name: String
    var price: Double
    var picture: String
    var description: String
    var keywords: String
}

extension MenuItem: Decodable {
    enum ItemKeys: String, CodingKey {
        case name
        case price
        case picture
        case description
        case keywords
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemKeys.self)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Double.self, forKey: .price)
        picture = try container.decode(String.self, forKey: .picture)
        description = try container.decode(String.self, forKey: .description)
        keywords = try container.decode(String.self, forKey: .keywords)
    }
}

