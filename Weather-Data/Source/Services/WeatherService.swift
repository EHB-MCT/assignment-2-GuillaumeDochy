//
//  WeatherService.swift
//  Weather-Data
//
//  Created by Guillaume Dochy on 14/10/2024.
//

import Foundation
import CoreLocation

class WeatherService {
    
    func logUserUsage(city: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        print("User requested weather data for \(city) at \(formattedDate)")
    }
    
    func getCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherResponse {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("abcde")&units=metric") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherResponse.self , from: data)
        
        return decodedData
    }
    
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?) -> Void) {
        logUserUsage(city: city)
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\("abcde")&units=metric"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("No data or error: \(String(describing: error))")
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            DispatchQueue.main.async {
                completion(weatherResponse)
            }
        }.resume()
    }
}
