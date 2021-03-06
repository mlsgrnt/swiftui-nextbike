//
//  ContentView.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/25/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import SwiftUI

struct StationsList: View {
    @ObservedObject var stationStore: StationStore
        
    var body: some View {        
        NavigationView {
            if stationStore.loading == true {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                .navigationBarTitle("\(stationStore.cityName) Loading")
            } else {
                List(stationStore.stations) { station in
                    NavigationLink(destination: BikeStationView(station: station)) {
                        BikeStationRow(station: station)
                    }.navigationBarTitle("\(self.stationStore.cityName)")
                }.listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
                
            }
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let stationStore = StationStore()
        return StationsList(stationStore: stationStore)
    }
}
