//
//  BikeModalView.swift
//  nextbikesnearme
//
//  Created by Miles Grant on 12/29/19.
//  Copyright © 2019 Blydro. All rights reserved.
//

import SwiftUI

struct BikeModalView: View {
    var bike: Bike
    
    var body: some View {
        HStack {
            if bike.state == State.ok {
                    Button("Rent") {
                        // did tap
                        print("Bike \(self.bike.id) rented")
                    }
                } else {
                    Text("Can't rent this bike")
            }
        }
        
    }
}

struct BikeModalView_Previews: PreviewProvider {
    static var previews: some View {
        BikeModalView(bike: Bike(id: "23", bikeType: 1, lockTypes: nil, active: true, state: State(rawValue: "ok")!, electricLock: true, boardcomputer: 3, pedelecBattery: nil, batteryPack: nil))
    }
}
