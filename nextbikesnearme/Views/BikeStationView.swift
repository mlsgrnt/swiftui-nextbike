//
//  BikeStationView.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/29/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import SwiftUI

struct BikeStationView: View {
    var station: Place

    var body: some View {
        VStack {
            List {
                Section(header: Text("\(station.bikes) \(pluralize(string: "bike", count: station.bikes))"), footer: Text("\(station.bookedBikes) \(pluralize(string: "bike", count: station.bookedBikes)) reserved")) {
                    ForEach(station.bikeList) { bike in
                        BikeRow(bike: bike)
                    }
                }
            }.listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
                .navigationBarTitle(Text(station.name), displayMode: .inline)
        }
    }
}

struct BikeStationView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationView(station: Place(id: 1, lat: 1, lng: 1, bike: true, name: "test", address: nil, spot: false, number: 4, bikes: 6, bookedBikes: 2, bikeRacks: 2, freeRacks: 4, specialRacks: 5, freeSpecialRacks: 3, maintenance: false, terminalType: "empty", bikeList: [Bike(id: "12", bikeType: 2, lockTypes: nil, active: true, state: State(rawValue: "ok")!, electricLock: true, boardcomputer: 5, pedelecBattery: nil, batteryPack: nil),Bike(id: "13", bikeType: 2, lockTypes: nil, active: true, state: State(rawValue: "ok")!, electricLock: true, boardcomputer: 5, pedelecBattery: nil, batteryPack: nil)], bikeNumbers: [], bikeTypes: [:], placeType: "8", rackLocks: false))
    }
}
