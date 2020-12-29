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
        
        configurateMainStackView(backGroundColor: .systemBackground, axis: .vertical, aligment: .fill, distribution: .fillProportionally, spacing: 5.0)
        
        let locationStackView = configurateNestedStackView(backGroundColor: .clear, axis: .horizontal,
                                                           alignment: .fill, distribution: .fill, spacing: 0.0)
        let locationLabel = configurateLocationLabel(with: "Kyiv, Ukraine", font: .boldSystemFont(ofSize: 20),
                                                     textColor: .black, textAlignment: .center, numOfLines: 0)
        locationStackView.addArrangedSubview(locationLabel)

        let weatherIconStackView = configurateNestedStackView(backGroundColor: .clear, axis: .horizontal,
                                                              alignment: .center, distribution: .fillEqually, spacing: 0.0)
        let weatherIcon = configurateWeatherImageView()
        weatherIconStackView.addArrangedSubview(weatherIcon)
        
        let pressureHumidityStackView = configurateNestedStackView(backGroundColor: .clear, axis: .horizontal,
                                                                   alignment: .fill, distribution: .fillEqually, spacing: 0.0)
        let pressureLabel = configurateLocationLabel(with: "740mm", font: .boldSystemFont(ofSize: 20),
                                                     textColor: .black, textAlignment: .center, numOfLines: 0)
        pressureHumidityStackView.addArrangedSubview(pressureLabel)
        let humidityLabel = configurateLocationLabel(with: "30%", font: .boldSystemFont(ofSize: 20),
                                                     textColor: .black, textAlignment: .center, numOfLines: 0)
        pressureHumidityStackView.addArrangedSubview(humidityLabel)
        
        let temperatureStackView = configurateNestedStackView(backGroundColor: .clear, axis: .horizontal,
                                                              alignment: .center, distribution: .fillEqually, spacing: 0.0)
        let temperatureLabel = configurateLocationLabel(with: "34˚C", font: .italicSystemFont(ofSize: 100.0),
                                                        textColor: .black, textAlignment: .center, numOfLines: 0)
        temperatureStackView.addArrangedSubview(temperatureLabel)

        let apparentTemperatureStackView = configurateNestedStackView(backGroundColor: .clear, axis: .horizontal,
                                                                      alignment: .center, distribution: .fillEqually, spacing: 0.0)
        let apparentTemperatureLabel = configurateLocationLabel(with: "Feels like: 34˚C", font: .italicSystemFont(ofSize: 25.0),
                                                                textColor: .black, textAlignment: .center, numOfLines: 0)
        apparentTemperatureStackView.addArrangedSubview(apparentTemperatureLabel)
        
        let refreshButtonStackView = configurateNestedStackView(backGroundColor: .clear, axis: .horizontal,
                                                                alignment: .center, distribution: .fill, spacing: 0.0)
        let refreshButtom = configurateRefreshButton(title: "Refresh", titleColor: .black, font: UIFont(name: "Arial", size: 18.0),
                                                     backgroundColor: .clear, cornerRadius: 3.0, borderWidth: 2.0, borderColor: .black)
        refreshButtonStackView.addArrangedSubview(refreshButtom)
        
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
        weatherImage.image = UIImage(named: "rain")
        weatherImage.contentMode = .scaleAspectFit
        
        createHeightAnchorConstraints(sender: weatherImage, heightAnchorValue: 250.0)
        
        return weatherImage
    }
    
    //MARK: - Configurate UILabel
    
    func configurateLocationLabel(with text: String, font: UIFont, textColor: UIColor,
                                  textAlignment: NSTextAlignment, numOfLines: Int) -> UILabel {
        let myLable = UILabel()
        myLable.text = text
        myLable.font = font
        myLable.textColor = textColor
        myLable.textAlignment = textAlignment
        myLable.numberOfLines = numOfLines
        
        return myLable
    }
    
    //MARK: - Configurate UIButton
    
    func configurateRefreshButton(title: String? = nil, titleColor: UIColor = .black,
                                  font: UIFont? = nil, backgroundColor: UIColor = .clear,
                                  cornerRadius: CGFloat = 0.0, borderWidth: CGFloat = 0.0,
                                  borderColor: UIColor = .clear) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 6.0
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = UIColor.yellow.cgColor
        
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return button
    }
    
    //MARK: - Constraints func
    
    func createMaineStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints                                                           = false
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0).isActive   = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive           = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0).isActive     = true
//        let bottomAnchor = mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
//        bottomAnchor.priority = UILayoutPriority(250)
//        bottomAnchor.isActive = true
    }
    
    func createHeightAnchorConstraints(sender: UIView, heightAnchorValue: CGFloat) {
        sender.translatesAutoresizingMaskIntoConstraints                            = false
        sender.heightAnchor.constraint(equalToConstant: heightAnchorValue).isActive = true
    }
    
    //MARK: - Button action
    
    @objc func buttonPressed(_ sender: UIButton) {
        print("button pressed")
    }
}
