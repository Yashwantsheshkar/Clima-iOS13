//
//  WeatherModel.swift
//  Clima
//
//  Created by Yashwant Sheshkar on 21/06/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    
    
//    so the code below uses the swift most powerfull apporoach of computed properties which instead of calling the funciton usese the var to compute and give the results
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName : String{
        switch conditionID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
    
    
//    func getConditionName(weatherId: Int) -> String{
//        switch weatherId {
//                case 200...232:
//                    return "cloud.bolt"
//                case 300...321:
//                    return "cloud.drizzle"
//                case 500...531:
//                    return "cloud.rain"
//                case 600...622:
//                    return "cloud.snow"
//                case 701...781:
//                    return "cloud.fog"
//                case 800:
//                    return "sun.max"
//                case 801...804:
//                    return "cloud.bolt"
//                default:
//                    return "cloud"
//                }
//
//    }
    
}
