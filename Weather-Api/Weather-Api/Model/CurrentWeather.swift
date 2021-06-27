//
//  CurrentWeather.swift
//  Weather-Api
//
//  Created by Антон Белый on 27.06.2021.
//

import UIKit

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    
    let feelsLiteTemperature: Double
    var feelsLiteTemperatureString: String {
        return "\(feelsLiteTemperature.rounded())"
    }
    
    let conditionCode: Int
    
    init?(weatherData: WeatherData) {
        cityName = weatherData.name
        temperature = weatherData.main.temp
        feelsLiteTemperature = weatherData.main.feelsLike
        conditionCode = weatherData.weather.first!.id
    }
}
