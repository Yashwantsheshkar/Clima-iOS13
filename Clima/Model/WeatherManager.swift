//
//  WeatherManager.swift
//  Clima
//
//  Created by Yashwant Sheshkar on 20/06/24.



import Foundation


struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d7a61867322bf7120744c870b0b0bcdb&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
