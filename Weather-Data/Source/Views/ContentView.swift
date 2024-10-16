//
//  ContentView.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 14/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = ContentViewModel()
    @State private var city: String = "London"

    var body: some View {
        VStack {
            if locationManager.authorizationStatus == .notDetermined {
                Button("Allow Location Access") {
                    locationManager.requestLocationAccess()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
            if let location = locationManager.userLocation {
                Text("User's location: \(location.latitude), \(location.longitude)")
                    .padding()
            } else {
                Text("Fetching location...")
                    .padding()
            }
            
            TextField("Enter city name", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Get Weather") {
                if let location = locationManager.userLocation {
                    viewModel.fetchWeather(latitude: location.latitude, longitude: location.longitude)
                } else {
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
