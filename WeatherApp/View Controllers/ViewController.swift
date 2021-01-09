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
        
//        let icon = WeatherIconManager.Rain.image
        
        //https://api.forecast.io/forecast/2a6d8e376a69c1ae07d4a52dd0c2dfdc/37.8267,-122.423
        
    }

    //MARK: - Func
    
    
    //MARK: - Actions
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
    }
    
}
