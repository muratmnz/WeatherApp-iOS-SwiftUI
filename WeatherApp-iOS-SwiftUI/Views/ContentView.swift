//
//  ContentView.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 13.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationService = LocationService()
    var weatherService = WeatherService()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationService.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await
                                //getting current weather lat and lon
                                weatherService
                                    .getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                            } catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else{
                if locationService.isLoading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationService)
                }
                 }
    }
    .background(Color(hue: 0.421, saturation: 0.735, brightness: 0.702))
    .preferredColorScheme(.dark)
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
