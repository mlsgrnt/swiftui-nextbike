//
//  StationStore.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/25/19.
//  Copyright © 2019 Blydro. All rights reserved.
//
import SwiftUI
import Combine
import CoreLocation

class StationStore: ObservableObject {
    // Some state which the view picks up
    @Published var stations: [Place]
    @Published var loading: Bool
    
    // For our location manager binding
    var locationManager: LocationManager
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        self.loading = true
        
        self.stations = []
        
        // Set up sink for the publised last known location
        self.locationManager = LocationManager()
        locationManager.startUpdating()
        locationManager.$lastKnownLocation
            .sink() {
                    self.sortStationsByLocation(location: $0)
            }
            .store(in: &cancellables)

        // Call the method which grabs the data from the server
        self.getStations()
        
    }
    
    // Sorts the current station list by a given location
    private func sortStationsByLocation(location: CLLocation?) {
        guard let location = location else {
            return
        }
        
        self.stations.sort(by: { $0.distance(to: location) < $1.distance(to: location) })
    }
    
    private func getStations() {
        guard let url = URL(string: NetworkManager.APIURL.stationsRequest()) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let stationsObject = try decoder.decode(Nextbikes.self, from: data)
                
                DispatchQueue.main.async {
                    // There is only 1 country and 1 city in the response currently. (it's filtered to glasgow on the server)
                    self.stations = stationsObject.countries[0].cities[0].places
                    
                    // Force a location sort
                    self.sortStationsByLocation(location: self.locationManager.lastKnownLocation)
                    self.loading = false
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
