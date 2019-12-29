//
//  BikeRow.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/29/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import SwiftUI

struct BikeRow: View {
    var bike: Bike
    
    var body: some View {
        HStack {
            Text("Bike \(bike.id)")
            Spacer()
            // This is swiftUI wierdness. Would be nice to use if let but that doens't work.
            if bike.batteryPack?.percentage != nil {
                Divider()
                Image(systemName: "battery.100")
                Text("\(String(bike.batteryPack!.percentage))")
            }
            
        }
    }
}

struct BikeRow_Previews: PreviewProvider {
    static var previews: some View {
        BikeRow(bike: Bike(id: "23", bikeType: 1, lockTypes: nil, active: true, state: State(rawValue: "ok")!, electricLock: true, boardcomputer: 3, pedelecBattery: nil, batteryPack: nil))
    }
}
