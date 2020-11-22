//
//  CurrentWeatherModel.swift
//  Json_WeatherApp
//
//  Created by Berker Vergi on 20.11.2020.
//


import Foundation
import UIKit

struct CurrentWeatherModel {
    let summary : String
    let icon : UIImage
    let temperature : String
    let humidity : String
    let precipatitonProbability : String
    
    init(data : CurrentWeather) {
        self.summary = data.summary
        self.icon = data.iconImage
        self.precipatitonProbability = "%\(data.precipProbability * 100)"
        self.temperature = "\(Int(data.temperature))"
        self.humidity = "%\(Int(data.humidity * 100))"
    }
}

