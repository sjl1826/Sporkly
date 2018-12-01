//
//  HomeViewController.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, MenuDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(forCellType: MenuCell.self)
        }
    }
    //let searchController = SearchBarController()
    //searchController.tableType = "food"
    var items: [MenuCellPresentable] = []
    var desserts: [MenuItem] = [] // 3 separate for organization?
    var entrees: [MenuItem] = []
    var drinks: [MenuItem] = []
    var allItems: [MenuItem] = [] // for loading tableview?
    var selectedRestaurant : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        API.shared.menuDelegate = self
        items = Restaurants.defaultRestaurants
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadWithAnimation()
    }

    func sortByLowestPrice() {
        let sorted = entrees.sorted(by:{$0.price < $1.price})
        allItems.removeAll()
        allItems = sorted
    }

    func sortByHighestPrice() {
        let sorted = entrees.sorted(by:{$0.price > $1.price})
        allItems.removeAll()
        allItems = sorted
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searched = searchBar.text
        let searchedUpper = searched?.uppercased()
        // for restaurants
        if selectedRestaurant == nil {
            for i in 0...items.count - 1  {
                let titleUpper = items[i].title?.uppercased()
                if titleUpper!.range(of: searchedUpper!) != nil {
                    print(items[i].title ?? "")
                }
            }
        }
        // for menu
        for i in 0...desserts.count - 1 {
            if desserts[i].name.range(of:searchedUpper!) != nil {
                print(desserts[i].name)
            } else if desserts[i].description.range(of:searchedUpper!) != nil {
                print(desserts[i].name)
            }
        }
        for i in 0...drinks.count - 1 {
            if drinks[i].name.range(of:searchedUpper!) != nil {
                print(drinks[i].name)
            } else if drinks[i].description.range(of:searchedUpper!) != nil {
                print(drinks[i].name)
            }
        }
        for i in 0...entrees.count - 1 {
            if entrees[i].name.range(of:searchedUpper!) != nil {
                print(entrees[i].name)
            } else if entrees[i].description.range(of:searchedUpper!) != nil {
                print(entrees[i].name)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: MenuCell.self, for: indexPath)
        cell.item = items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].didSelectCell()
    }

    func didGetMenu(menu: Menu) {
        var menuItems = [MenuItem]()
        for menuItem in menu.entrees { menuItems.append(menuItem); self.entrees.append(menuItem) }
        for menuItem in menu.desserts { menuItems.append(menuItem); self.desserts.append(menuItem) }
        for menuItem in menu.drinks { menuItems.append(menuItem); self.drinks.append(menuItem) }
        self.sortByLowestPrice()
        var newItems = [MenuCellPresentable]()
        for item in menuItems {
            let newItem: ReusableItem = ReusableItem(title: item.name, imageName: item.name,
                                                     detail: "", price: item.price,
                                                     category: item.description)
            newItems.append(newItem)
        }
        items = newItems
        self.tableView.reloadWithAnimation()
    }
}
