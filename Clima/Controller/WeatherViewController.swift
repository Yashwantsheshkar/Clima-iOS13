//
//  ViewController.swift
//  Clima
//


//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        
        
//        print(searchTextField.text!)
        searchTextField.endEditing(true)
        
        
        
    }
    
/* we are using the below func as if we have created the ib
 action on return button because when we press the return button
 on keyboard we are prosessing the code written between the curly braces. */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
//        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Type something"
            return false
           
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        we use "if let" to safely unwrapp the optional data type for avoiding crashes.
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
    
}

