//
//  Extensions.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 10/19/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit

extension UIColor {
    @nonobjc class var twilightBlue: UIColor {
        return UIColor(red: 7.0 / 255.0, green: 74.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    }
}

extension UITableView {
    func dequeueCell<T: UITableViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: type.self),
                                   for: indexPath) as! T
    }

    func registerNib(forCellType cellType: UITableViewCell.Type) {
        let className = String(describing: cellType.self)
        registerNib(withName: className)
    }

    func registerNib(withName nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: nibName)
    }
}

extension UITableView {
    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.5,
                           delay: 0.08 * Double(delayCounter),
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
