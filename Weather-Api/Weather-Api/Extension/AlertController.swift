//
//  AlertController.swift
//  Weather-Api
//
//  Created by Антон Белый on 24.06.2021.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            tf.placeholder = "Введите город"
        }
        let search = UIAlertAction(title: "Поиск", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
}
