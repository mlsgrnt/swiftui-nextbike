//
//  BikeStationRow.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/25/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import SwiftUI

struct BikeStationRow: View {
    var station: Place
    
    var body: some View {
        HStack() {
            Text(station.name)
            Spacer()
            Text(String(station.bikes))
                .fontWeight(.bold)
                .padding(10.0)
                .foregroundColor(.primary)
                .background(Color.orange)
                .cornerRadius(5.0)

        }
        .padding(5.0)
    }
}

struct BikeStationRow_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationRow(station: Place(id: 1, lat: 1, lng: 1, bike: true, name: "test", address: nil, spot: false, number: 4, bikes: 6, bookedBikes: 2, bikeRacks: 2, freeRacks: 4, specialRacks: 5, freeSpecialRacks: 3, maintenance: false, terminalType: TerminalType.empty, bikeList: [], bikeNumbers: [], bikeTypes: [:], placeType: "", rackLocks: false))
    }
}
