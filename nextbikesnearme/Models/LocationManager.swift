//
//  LocationManager.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/25/19.
//  Copyright © 2019 Blydro. All rights reserved.
//
import CoreLocation
import Combine

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let manager: CLLocationManager

    @Published var lastKnownLocation: CLLocation?

    init(manager: CLLocationManager = CLLocationManager()) {
        self.manager = manager
        super.init()
    }

    func startUpdating() {
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.desiredAccuracy = 500.0
        self.manager.activityType = .other
        self.manager.startMonitoringSignificantLocationChanges()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        DispatchQueue.main.async {
            self.lastKnownLocation = locations.last
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}
