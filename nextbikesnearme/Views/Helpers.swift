//
//  Helpers.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/29/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import Foundation

func pluralize(string: String, count: Int) -> String {
    return count == 1 ? string : string + "s"
}
