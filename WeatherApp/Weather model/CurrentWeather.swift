//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 11.12.2020.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
}

extension CurrentWeather {
    
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    
    var appearentTemperatureString: String {
        return "\(Int(appearentTemperature))˚C"
    }
    
    var humidityString: String {
        return "\(Int(humidity))%"
    }
    
    var pressureString: String {
        return "\(Int(pressure))mm"
    }    
}
