//
//  NetworkManager.swift
//  Weather-Api
//
//  Created by Антон Белый on 26.06.2021.
//

import UIKit

class NetworkManager {
    
    
    func fetchCurrent(city: String, completionHandler: @escaping (CurrentWeather) -> Void) {
        let apiKey = "b4046417e67849f7ebc2960446ac2b5f"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    completionHandler(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(weatherData: weatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
        
    }
    
}
