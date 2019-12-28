//
//  NetworkManager.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/25/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    struct APIURL {
        static func stationsRequest(city: Int) -> String {
            return "https://fierce-chestnut.glitch.me/live/\(city)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func citiesRequest() -> String {
            return "https://fierce-chestnut.glitch.me/countries"
        }
    }        
}
