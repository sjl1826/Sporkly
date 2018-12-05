//
//  HomeViewController.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit
struct Plate {
    static var plateArray = [MenuCellPresentable] ()
}
class HomeViewController: UIViewController, UISearchBarDelegate, MenuDelegate, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var sporklyLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.registerNib(forCellType: MenuCell.self)
        }
    }

    var items: [MenuCellPresentable] = []
    var desserts: [MenuItem] = [] // 3 separate for organization?
    var entrees: [MenuItem] = []
    var drinks: [MenuItem] = []
    var menuItems: [MenuItem] = [] // for loading tableview?
    var allItems: [MenuItem] = []
    var selectedRestaurant : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIApplication.shared.keyWindow?.traitCollection.forceTouchCapability == .available{
            registerForPreviewing(with: self, sourceView: self.tableView)
        }
        let tappedSporkly = UITapGestureRecognizer(target: self, action: #selector(tappedSporklyLabel))
        sporklyLabel.addGestureRecognizer(tappedSporkly)
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
        let placeholder = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
        placeholder?.textColor = UIColor.white
        searchBar.setImage(UIImage(named:"searchIcon"), for: .search, state: .normal)
        API.shared.menuDelegate = self
        items = Restaurants.defaultRestaurants
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadWithAnimation()
    }

    @IBAction func filterList(_ sender: Any) {
        sortByLowestPrice()
    }

    @IBAction func showPlate(_ sender: Any) {
        let plateBoard = UIStoryboard(name: "Plate", bundle: nil)
        let plate = plateBoard.instantiateViewController(withIdentifier: "PlateViewController") as! PlateViewController
        plate.view.backgroundColor = UIColor.clear
        plate.modalPresentationStyle = .overCurrentContext
        self.present(plate, animated: true, completion: nil)
    }

    func sortByLowestPrice() {
        let sorted = menuItems.sorted(by:{$0.price < $1.price})
        menuItems.removeAll()
        menuItems = sorted
        items.removeAll()
        reloadItemList()
        tableView.reloadWithAnimation()
    }

    func sortByHighestPrice() {
        let sorted = menuItems.sorted(by:{$0.price > $1.price})
        menuItems.removeAll()
        menuItems = sorted
        reloadItemList()
        tableView.reloadWithAnimation()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searched = searchBar.text
        let searchedUpper = searched?.uppercased()
        // for restaurants
        menuItems.removeAll()
        items.removeAll()
        if selectedRestaurant == nil {
            for i in 0...Restaurants.defaultRestaurants.count - 1   {
                let titleUpper = Restaurants.defaultRestaurants[i].title?.uppercased()
                if titleUpper!.range(of: searchedUpper!) != nil {
                   items.append(Restaurants.defaultRestaurants[i])
                }
            }
        } else {
        for i in 0...allItems.count - 1 {
            if allItems[i].name.range(of:searchedUpper!) != nil {
                menuItems.append(allItems[i])
            } else if allItems[i].description.range(of:searchedUpper!) != nil {
                menuItems.append(allItems[i])
            }
        }
            reloadItemList()
        }
        tableView.reloadWithAnimation()
        self.searchBar.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        menuItems.removeAll()
        if(selectedRestaurant == nil) {
            items = Restaurants.defaultRestaurants
        } else {
            menuItems = allItems
            reloadItemList()
        }
        self.searchBar.text = ""
        tableView.reloadWithAnimation()
        self.searchBar.endEditing(true)
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
        if (selectedRestaurant == nil) {
            items[indexPath.row].didSelectCell()
            selectedRestaurant = items[indexPath.row].title
        } else if ((selectedRestaurant != nil) && menuItems.count > 0) {
            let foodInfo = menuItems[indexPath.row]
            let detailsBoard = UIStoryboard(name: "DetailsPage", bundle: nil)
            let detailPage = detailsBoard.instantiateViewController(withIdentifier: "DetailsPageViewController") as! DetailsPageViewController
            detailPage.foodDescriptionText = foodInfo.description
            detailPage.foodPriceText = String(foodInfo.price)
            detailPage.foodNameText = foodInfo.name
            detailPage.item = items[indexPath.row]
            self.present(detailPage, animated: true, completion: nil)
        }
    }

    func didGetMenu(menu: Menu) {
        menuItems.removeAll()
        for menuItem in menu.entrees { menuItems.append(menuItem); self.entrees.append(menuItem) }
        for menuItem in menu.desserts { menuItems.append(menuItem); self.desserts.append(menuItem) }
        for menuItem in menu.drinks { menuItems.append(menuItem); self.drinks.append(menuItem) }
        reloadItemList()
        allItems = menuItems
        self.tableView.reloadWithAnimation()
    }

    func reloadItemList() {
        var newItems = [MenuCellPresentable]()
        for item in menuItems {
            var picName = String()
            if let pic = UIImage(named: item.name) {
                print(pic) //temporarily silencing warning
                picName = item.name
            } else {
                picName = "NoPictureIcon"
            }
            let newItem: ReusableItem = ReusableItem(title: item.name, imageName: picName,
                                                     detail: "", price: item.price,
                                                     category: item.description)
            newItems.append(newItem)
        }
        items = newItems
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
          show(viewControllerToCommit, sender: self)
    }
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let indexPath = self.tableView?.indexPathForRow(at: location)
        let foodInfo = self.menuItems[indexPath!.row]
        guard  let cell = self.tableView.cellForRow(at: indexPath!) else { return nil }
        let peekStoryboard = UIStoryboard(name: "PeekAndPop", bundle: nil)
        let popVC = peekStoryboard.instantiateViewController(withIdentifier: "PeekAndPop") as! PeekAndPop
        popVC.descriptionText = foodInfo.description
        popVC.view.backgroundColor = UIColor.clear
        popVC.modalPresentationStyle = .overCurrentContext
        popVC.preferredContentSize = CGSize(width: 0.0, height: 400)
        popVC.item = items[indexPath!.row]
        previewingContext.sourceRect = cell.frame
        return popVC
    }
    @objc func tappedSporklyLabel(sender:UITapGestureRecognizer) {
        selectedRestaurant = nil
        items = Restaurants.defaultRestaurants
        tableView.reloadWithAnimation()
    }
   
}
