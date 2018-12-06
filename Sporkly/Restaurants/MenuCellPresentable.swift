//
//  MenuCellPresentable.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit

protocol MenuCellPresentable {
    var backgroundColor: UIColor { get }
    var title: String? { get }
    var titleColor: UIColor { get }
    var icon: UIImage? { get }
    var detail: String? { get }
    var detailColor: UIColor { get }
    var left: String? { get }
    var right: String? { get }
}

extension MenuCellPresentable {
    func didSelectCell() {
        API.getMenu { (menu) in
            API.shared.menuDelegate?.didGetMenu(menu: menu)
        }
    }

    func scaleUIImageToSize( image: UIImage, size: CGSize) -> UIImage {
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }

    var titleColor: UIColor {
        return .black
    }

    var backgroundColor: UIColor {
        return .white
    }

    var icon: UIImage? {
        return nil
    }

    var detail: String? {
        return nil
    }

    var detailColor: UIColor {
        return .black
    }

    var left: String? {
        return nil
    }

    var right: String? {
        return nil
    }
}
