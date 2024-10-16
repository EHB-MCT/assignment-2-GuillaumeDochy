//
//  ContentView.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 14/10/2024.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var city: String = "London"

    var body: some View {
        VStack {
            
            TextField("Enter city name", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Get Weather") {
                if city.isEmpty {
                    print("Input missing")
                } else if city.isEmpty == false {
                    viewModel.fetchWeather(for: city)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            if let weather = viewModel.weather {
                Text("Temperature: \(weather.main.temp, specifier: "%.1f")°C")
                    .font(.largeTitle)
                    .padding()

                Text("Condition: \(weather.weather.first?.description ?? "Unknown")")
                    .font(.title2)
                    .padding()
            } else {
                Text("Enter a city to get weather data.")
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
