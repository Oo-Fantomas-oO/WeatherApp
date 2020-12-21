//
//  ViewController.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 10.12.2020.
//

import UIKit

class ViewController: UIViewController {

    private let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateMainStackView(backGroundColor: .white, axis: .vertical, aligment: .fill, distribution: .fillProportionally, spacing: 10.0)
        
        let locationStackView = configurateNestedStackView(backGroundColor: .white, axis: .horizontal, alignment: .fill, distribution: .fill, spacing: 0.0)
        let pressureHumidityStackView = configurateNestedStackView(backGroundColor: .white, axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 0.0)
        let weatherIconStackView = configurateNestedStackView(backGroundColor: .white, axis: .horizontal, alignment: .center, distribution: .fillProportionally, spacing: 0.0)
        
        let locationLabel = configurateLocationLabel(with: "Kyiv, Ukraine", font: .boldSystemFont(ofSize: 20), textColor: .black, textAlignment: .center, numOfLines: 0)
        locationStackView.addArrangedSubview(locationLabel)

        let pressureLabel = configurateLocationLabel(with: "740mm", font: .boldSystemFont(ofSize: 20), textColor: .black, textAlignment: .center, numOfLines: 0)
        pressureHumidityStackView.addArrangedSubview(pressureLabel)

        let humidityLabel = configurateLocationLabel(with: "30%", font: .boldSystemFont(ofSize: 20), textColor: .black, textAlignment: .center, numOfLines: 0)
        pressureHumidityStackView.addArrangedSubview(humidityLabel)
        
        let image = configurateWeatherImageView()
        weatherIconStackView.addArrangedSubview(image)
    }

    //MARK: - Configurate Stack View
    
    func configurateMainStackView(backGroundColor: UIColor, axis: NSLayoutConstraint.Axis,
                                  aligment: UIStackView.Alignment,
                                  distribution: UIStackView.Distribution, spacing: CGFloat) {
        view.addSubview(mainStackView)
        
        mainStackView.backgroundColor = backGroundColor
        mainStackView.axis = axis
        mainStackView.alignment = aligment
        mainStackView.distribution = distribution
        mainStackView.spacing = spacing
        
        createMaineStackViewConstraints()
    }
    
    func configurateNestedStackView(backGroundColor: UIColor, axis: NSLayoutConstraint.Axis,
                                    alignment: UIStackView.Alignment,
                                    distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView{
        let stackView = UIStackView()
        mainStackView.addArrangedSubview(stackView)

        stackView.backgroundColor = backGroundColor
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        
        return stackView
    }
    
    //MARK: - Configurate UIImageView
    
    func configurateWeatherImageView () -> UIImageView {
        let weatherImage = UIImageView()
        weatherImage.image = UIImage(named: "sunny")
        weatherImage.contentMode = .scaleAspectFit
//        weatherImage.backgroundColor = .black
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        return weatherImage
    }
    
    //MARK: - Configurate UILabel
    
    func configurateLocationLabel(with text: String, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment, numOfLines: Int) -> UILabel {
        let myLable = UILabel()
        myLable.text = text
        myLable.font = font
        myLable.textColor = textColor
        myLable.textAlignment = textAlignment
        myLable.numberOfLines = numOfLines
        
        return myLable
    }
    
    //MARK: - Constraints func
    
    func createMaineStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints                                                           = false
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0).isActive   = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive           = true
        let bottomAnchor = mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
        bottomAnchor.priority = UILayoutPriority(250)
        bottomAnchor.isActive = true
    }
}

