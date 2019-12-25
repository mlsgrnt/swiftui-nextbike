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
        static func stationsRequest() -> String {
            return "https://brave-silk.glitch.me/nextbike".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
    }        
}
