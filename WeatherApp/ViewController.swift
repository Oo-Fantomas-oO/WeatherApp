//
//  ViewController.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 10.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10.0, appearentTemperature: 5.0,
                                            humidity: 30.0, pressure: 750.0, icon: icon)
        updateUIWith(currentWeather: currentWeather)
        //https://api.forecast.io/forecast/2a6d8e376a69c1ae07d4a52dd0c2dfdc/37.8267,-122.423
        
    }

    //MARK: - Func
    
    func updateUIWith(currentWeather: CurrentWeather) {
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.humidityLabel.text = currentWeather.humidityString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
    }
    
    //MARK: - Actions
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
    }
    
}
