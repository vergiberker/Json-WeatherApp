//
//  Coordinate.swift
//  Json_WeatherApp
//
//  Created by Berker Vergi on 22.11.2020.
//

import Foundation


struct Coordinate {
    
    let latitude  : Double
    let longitude : Double
}

extension Coordinate : CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var alcatrazIsland : Coordinate {
        return Coordinate(latitude: 37.8267, longitude: -122.4233)
    }
    
    
}
