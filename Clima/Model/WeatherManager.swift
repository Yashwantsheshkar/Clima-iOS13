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
        performRequest(urlString: urlString)
    }
    
    
    
    
    
    func performRequest(urlString: String){
        //        NETWORKING
        
        //        1.Create URL and since the URL is an optional therefore using the if let for unwraping and then perfoming the further steps of networking
        if let url = URL(string: urlString){
            
            //            2. Create URL session
            let session = URLSession(configuration: .default)
            
            //            3. Giving session a task to perform using the complition handler
            
            
            let task = session.dataTask(with: url) { data, resoponse, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                    
                }
            }
            
            //            4. Start a Task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            print(weather.temperatureString)
            
            
        } catch {
            print("error!")
        }
        
        
        
    }
    
    
    
}


