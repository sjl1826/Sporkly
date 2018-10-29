//
//  SporkStoryboard.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 10/19/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit

enum SPStoryboardType: String {
    case main = "Main"
    case launch = "Launch"
}

enum SPStoryboardId: String {
    case launch = "LaunchViewController"

    var id: String {
        return rawValue
    }

    var storyboardType: SPStoryboardType {
        switch self {
        case .launch:
            return .launch
        }
    }
}

class SPStoryboardFactory {

    private static func storyboard(_ spStoryboardType: SPStoryboardType) -> UIStoryboard {
        return UIStoryboard(name: spStoryboardType.rawValue, bundle: nil)
    }

    static func instantiate<T>(_ viewControllerType: T.Type, fromStoryboard spStoryboardType: SPStoryboardType) -> T {
        let spStoryboard = storyboard(spStoryboardType)
        let identifier = String(describing: viewControllerType.self)
        return spStoryboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    static func instantiateInitialViewController<T>(_ spStoryboardType: SPStoryboardType, as initialViewControllerType: T.Type) -> T {
        return storyboard(spStoryboardType).instantiateInitialViewController() as! T
    }

    static func initiateViewController<T>(storyboardId: String, viewControllerType: T.Type, fromStoryboard spStoryboardType: SPStoryboardType) -> T {
        return storyboard(spStoryboardType).instantiateViewController(withIdentifier: storyboardId) as! T
    }

    static func initiateViewController<T>(storyboardId: SPStoryboardId, viewControllerType: T.Type) -> T {
        let storyboardType = storyboardId.storyboardType
        return storyboard(storyboardType).instantiateViewController(withIdentifier: storyboardId.id) as! T
    }
}
