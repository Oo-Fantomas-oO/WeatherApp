//
//  ViewController+AlertController.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 10.01.2021.
//

import UIKit

extension ViewController {
    
    func presentSearchAlertController(withTitle title: String?, message: String?,
                                      style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alertCont = UIAlertController(title: title, message: message, preferredStyle: style)
        alertCont.addTextField { tf in
            let cities = ["Kyiv", "Kharkiv", "Lviv", "Odesa"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertCont.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cansel = UIAlertAction(title: "Cansel", style: .cancel, handler: nil)
        
        alertCont.addAction(search)
        alertCont.addAction(cansel)
        present(alertCont, animated: true, completion: nil)
    }
}

