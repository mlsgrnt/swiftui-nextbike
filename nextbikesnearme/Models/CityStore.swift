//
//  CityStore.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/28/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import Combine
import SwiftUI
import CoreLocation


class CityStore: ObservableObject {
    
    let semaphore = DispatchSemaphore(value: 0)
    @Published var city: City?
    var nextbikes: Nextbikes

    init() {
        // Set city to null
        self.nextbikes = Nextbikes(countries: [])
        
        // Download country list
        getCountryList()
    }
    
    // Method to update city based on geolocation
    func updateCityWithLocation(_ location: CLLocation?) {
        guard let location = location else {
            return
        }
        
        // Don't do anything until the country list is present!
        if nextbikes.countries.count == 0 {
            self.semaphore.wait()
        }
        
        var minDistance = Double.greatestFiniteMagnitude
        var minCity: City?
                
        for country in nextbikes.countries {
            for city in country.cities {
                let distance = location.distance(from: CLLocation(latitude: city.lat, longitude: city.lng))
                
                if distance < minDistance {
                    minDistance = distance
                    minCity = city
                }
            }
        }
                
        if minCity != nil {
            self.city = minCity
        }
    }
    
    // Method to download country list
    private func getCountryList() {
        guard let url = URL(string: NetworkManager.APIURL.citiesRequest()) else {
            return
        }
                
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let countries = try decoder.decode(Nextbikes.self, from: data)
                
                DispatchQueue.main.async {
                    self.nextbikes = countries
                    self.semaphore.signal()
                }
            } catch {
                print("Failure downloading country list")
                print(error)
            }
        }.resume()
    }
}
