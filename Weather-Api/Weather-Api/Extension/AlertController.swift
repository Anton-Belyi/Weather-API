//
//  AlertController.swift
//  Weather-Api
//
//  Created by Антон Белый on 24.06.2021.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style ) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["Moscow", "Rostov-on-Don", "Saint_Petersburg"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Поиск", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("Поиск по городу\(cityName)")
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
}
