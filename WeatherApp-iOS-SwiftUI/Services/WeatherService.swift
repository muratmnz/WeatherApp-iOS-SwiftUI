//
//  WeatherService.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 16.07.2023.
//

import Foundation
import CoreLocation

class WeatherService {
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws -> ResponseBody {
        //api url
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid={apikey}") else { fatalError("Missing URL") }
        print(url)
        //url request
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data.") }
        
        //decoded response body data to Swift UI
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
    }
}

//response body
struct ResponseBody : Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main : MainResponse
    var name : String
    var wind : WindResponse
    
    struct CoordinatesResponse : Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
