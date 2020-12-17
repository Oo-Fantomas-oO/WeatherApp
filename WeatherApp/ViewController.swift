//
//  ViewController.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 10.12.2020.
//

import UIKit

class ViewController: UIViewController {

    let weatherView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .darkGray
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createStackViewConstraint()
        createWeatherViewConstraint()
        
        stack.addArrangedSubview(weatherView)
        view.addSubview(stack)
    }

    //MARK: - Constraint func
    
    func createWeatherViewConstraint() {
        weatherView.leftAnchor.constraint(equalTo: stack.leftAnchor, constant: 20.0).isActive = true
        weatherView.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 1/3).isActive = true
        weatherView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        weatherView.centerYAnchor.constraint(equalTo: stack.centerYAnchor).isActive = true
    }
    
    func createStackViewConstraint() {
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0).isActive = true
    }
}

