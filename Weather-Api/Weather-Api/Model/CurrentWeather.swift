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
        return String(format: "%.0f", temperature)
    }
    
    let feelsLiteTemperature: Double
    var feelsLiteTemperatureString: String {
        return String(format: "%.0f", feelsLiteTemperature)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.ftll"
        case 801...804: return "cloud.fill"
        default: return "network"
        }
    }
    
    init?(weatherData: WeatherData) {
        cityName = weatherData.name
        temperature = weatherData.main.temp
        feelsLiteTemperature = weatherData.main.feelsLike
        conditionCode = weatherData.weather.first!.id
    }
}
