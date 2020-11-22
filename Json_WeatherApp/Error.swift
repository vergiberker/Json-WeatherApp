//
//  Error.swift
//  Json_WeatherApp
//
//  Created by Berker Vergi on 22.11.2020.
//

import Foundation

enum Error {
    case requestError
    case ResponseUnsuccesful(statusCode : Int)
    case invalidData
    case JSONParsingError
    case invalidURL
    
}
