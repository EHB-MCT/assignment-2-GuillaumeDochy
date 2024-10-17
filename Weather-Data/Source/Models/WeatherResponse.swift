//
//  WeatherResponse.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 14/10/2024.
//

import Foundation

struct WeatherResponse: Decodable, Equatable {
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let timezone: Int

    struct Main: Decodable, Equatable {
        let temp: Double
        let humidity: Int
        let pressure: Int
    }

    struct Weather: Decodable, Equatable {
        let description: String
    }

    struct Wind: Decodable, Equatable {
        let speed: Double
    }
}
