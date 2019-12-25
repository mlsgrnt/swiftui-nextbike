//
//  PlaceExtension.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/25/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import CoreLocation

extension Place {
    func distance(to location: CLLocation) -> CLLocationDistance {
        let ourLocation = CLLocation(latitude: self.lat, longitude: self.lng)
        return location.distance(from: ourLocation)
    }
}
