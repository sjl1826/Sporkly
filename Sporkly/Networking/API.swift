//
//  API.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import Moya

class API {
    static let provider = MoyaProvider<MainAPI>()
}

extension API {
    static func getMenu(completion: @escaping (Menu) -> Void) {
        provider.request(.getMenu()) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Menu.self, from: response.data)
                    completion(results)
                } catch let err {
                    print("Decoding Failure")
                    print(err)
                }
            case .failure:
                print("Request failed")
            }
        }
    }
}
