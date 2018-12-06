//
//  Moya.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import Moya

enum MainAPI {
    case getMenu()
}

extension MainAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://floating-stream-88357.herokuapp.com/menu")!
    }

    var path: String {
        switch self {
        case .getMenu:
            return "/menu"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getMenu:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getMenu:
            return .requestPlain
        }
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
