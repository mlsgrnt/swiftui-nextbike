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
                .navigationBarTitle("Loading")
            } else {
                List(stationStore.stations) { station in
                    BikeStationRow(station: station)
                }
                .navigationBarTitle("Glasgow Nextbikes")
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
