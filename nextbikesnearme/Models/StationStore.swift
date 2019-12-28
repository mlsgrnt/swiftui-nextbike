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
    
    // For our city store
    var cityStore: CityStore
    @Published var cityName: String // To make the view code prettier
    
    init() {
        self.loading = true
        
        self.stations = []
        
        self.cityStore = CityStore()
        
        self.cityName = ""
        
        // Set up sink for the publised last known location
        self.locationManager = LocationManager()
        locationManager.startUpdating()
        locationManager.$lastKnownLocation
            .sink() {
                    // Call the cityStore method which updates the correct city
                    self.cityStore.updateCityWithLocation($0)
                    self.sortStationsByLocation(location: $0)
            }
            .store(in: &cancellables)

        // Grab city info from server when we have the city id
        cityStore.$city
            .sink() {
                guard let city = $0 else {
                    return
                }
                
                print("new best city!")
                
                // Call the method which grabs the bikes from the server
                self.getStations(city: city.uid)
                DispatchQueue.main.async {
                    self.cityName = city.name
                }
        }
        .store(in: &cancellables)
    }
    
    // Sorts the current station list by a given location
    private func sortStationsByLocation(location: CLLocation?) {
        guard let location = location else {
            return
        }
        
        self.stations.sort(by: { $0.distance(to: location) < $1.distance(to: location) })
    }
    
    private func getStations(city: Int) {
        guard let url = URL(string: NetworkManager.APIURL.stationsRequest(city: city)) else {
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
                    // There is only 1 country and 1 city in the response becuase we filter on the server
                    guard let stations = stationsObject.countries[0].cities[0].places else {
                        return
                    }
                    self.stations = stations
                    
                    // Force a location sort
                    self.sortStationsByLocation(location: self.locationManager.lastKnownLocation)
                    self.loading = false
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
}
