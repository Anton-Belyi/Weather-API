//
//  NetworkManager.swift
//  Weather-Api
//
//  Created by Антон Белый on 26.06.2021.
//

import UIKit

struct NetworkManager {
    func fetchCurrent(city: String) {
        let apiKey = "b4046417e67849f7ebc2960446ac2b5f"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}
