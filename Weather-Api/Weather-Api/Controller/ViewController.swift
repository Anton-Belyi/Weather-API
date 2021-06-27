//
//  ViewController.swift
//  Weather-Api
//
//  Created by Антон Белый on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkManager = NetworkManager()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        networkManager.fetchCurrent(city: "rostov-on-don") { currentWeather in
            
        }
    }

    
    
    @IBAction func searchCity(_ sender: UIButton) {
        presentSearchAlertController(withTitle: "Введите город", message: nil, style: .alert) { city in
            self.networkManager.fetchCurrent(city: city) { currentWeather in
                
            }
        }
    }
    
}

