//
//  WeatherIconManager.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 22.12.2020.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case ClearDay        = "clear-day"
    case ClearNight      = "clear-night"
    case Rain            = "rain"
    case Snow            = "snow"
    case Cloudy          = "cloudy"
    case ThunderStorm    = "thunderstorm"
    case PartlyCloudyDay = "partly-cloudy-day"
    case UnpredictedIcon = "unpredicted-icon"
    
    init(rawValue: String) {
        switch rawValue {
        case "clear-day" : self = .ClearDay
        case "claer-night" : self = .ClearNight
        case "rain" : self = .Rain
        case "snow" : self = .Snow
        case "cloudy" : self = .Cloudy
        case "thunderstorm" : self = .ThunderStorm
        case "partly-cloudy-day" : self = .PartlyCloudyDay
        default: self = .UnpredictedIcon
        }
    }
}

extension WeatherIconManager {
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
