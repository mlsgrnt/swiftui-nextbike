// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Nextbikes
struct Nextbikes: Codable {
    let countries: [Country]
}

// MARK: - Country
struct Country: Codable {
    let lat, lng: Double
    let zoom: Int
    let name, hotline, domain, language: String
    let email: String?
    let timezone, currency, countryCallingCode: String
    let systemOperatorAddress, country, countryName: String
    let terms, policy, website: String
    let showBikeTypes, showBikeTypeGroups, showFreeRacks: Bool
    let bookedBikes, setPointBikes, availableBikes: Int
    let cappedAvailableBikes, noRegistration: Bool
    let pricing: String
    let cities: [City]

    enum CodingKeys: String, CodingKey {
        case lat, lng, zoom, name, hotline, domain, language, email, timezone, currency
        case countryCallingCode = "country_calling_code"
        case systemOperatorAddress = "system_operator_address"
        case country
        case countryName = "country_name"
        case terms, policy, website
        case showBikeTypes = "show_bike_types"
        case showBikeTypeGroups = "show_bike_type_groups"
        case showFreeRacks = "show_free_racks"
        case bookedBikes = "booked_bikes"
        case setPointBikes = "set_point_bikes"
        case availableBikes = "available_bikes"
        case cappedAvailableBikes = "capped_available_bikes"
        case noRegistration = "no_registration"
        case pricing, cities
    }
}

// MARK: - City
struct City: Codable {
    let uid: Int
    let lat, lng: Double
    let zoom: Int
    let mapsIcon, alias: String
    let cityBreak: Bool
    let name: String
    let numPlaces: Int
    let refreshRate: String
    let bounds: Bounds
    let bookedBikes, setPointBikes, availableBikes: Int
    let returnToOfficialOnly: Bool
    let bikeTypes: [String: Int]
    let website: String
    let places: [Place]?

    enum CodingKeys: String, CodingKey {
        case uid, lat, lng, zoom
        case mapsIcon = "maps_icon"
        case alias
        case cityBreak = "break"
        case name
        case numPlaces = "num_places"
        case refreshRate = "refresh_rate"
        case bounds
        case bookedBikes = "booked_bikes"
        case setPointBikes = "set_point_bikes"
        case availableBikes = "available_bikes"
        case returnToOfficialOnly = "return_to_official_only"
        case bikeTypes = "bike_types"
        case website, places
    }
}

// MARK: - Bounds
struct Bounds: Codable {
    let southWest, northEast: NorthEast

    enum CodingKeys: String, CodingKey {
        case southWest = "south_west"
        case northEast = "north_east"
    }
}

// MARK: - NorthEast
struct NorthEast: Codable {
    let lat, lng: Double
}

// MARK: - Place
struct Place: Codable, Identifiable {
    let id: Int
    let lat, lng: Double
    let bike: Bool
    let name: String
    let address: String?
    let spot: Bool
    let number, bikes, bookedBikes, bikeRacks: Int
    let freeRacks, specialRacks, freeSpecialRacks: Int
    let maintenance: Bool
    let terminalType: String
    let bikeList: [BikeList]
    let bikeNumbers: [String]
    let bikeTypes: [String: Int]
    let placeType: String
    let rackLocks: Bool

    enum CodingKeys: String, CodingKey {
        case lat, lng, bike, name, address, spot, number, bikes
        case id = "uid"
        case bookedBikes = "booked_bikes"
        case bikeRacks = "bike_racks"
        case freeRacks = "free_racks"
        case specialRacks = "special_racks"
        case freeSpecialRacks = "free_special_racks"
        case maintenance
        case terminalType = "terminal_type"
        case bikeList = "bike_list"
        case bikeNumbers = "bike_numbers"
        case bikeTypes = "bike_types"
        case placeType = "place_type"
        case rackLocks = "rack_locks"
    }
}

// MARK: - BikeList
struct BikeList: Codable {
    let number: String
    let bikeType: Int
    let lockTypes: [LockType]
    let active: Bool
    let state: State
    let electricLock: Bool
    let boardcomputer: Int
    let pedelecBattery: Int?
    let batteryPack: BatteryPack?

    enum CodingKeys: String, CodingKey {
        case number
        case bikeType = "bike_type"
        case lockTypes = "lock_types"
        case active, state
        case electricLock = "electric_lock"
        case boardcomputer
        case pedelecBattery = "pedelec_battery"
        case batteryPack = "battery_pack"
    }
}

// MARK: - BatteryPack
struct BatteryPack: Codable {
    let percentage: Int
}

enum LockType: String, Codable {
    case analogCodeLock = "analog_code_lock"
    case forkLock = "fork_lock"
    case frameLock = "frame_lock"
    case rackAdapter = "rack_adapter"
}

enum State: String, Codable {
    case ok = "ok"
}
