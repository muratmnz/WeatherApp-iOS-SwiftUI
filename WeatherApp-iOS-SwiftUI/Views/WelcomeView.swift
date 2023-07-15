//
//  WelcomeView.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 15.07.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationServer
    
    var body: some View {
        VStack{
            VStack{
                Text("Welcome the WeatherApp")
                    .bold().font(.title)
                
                Text("Share us your location to get the weather in your area.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            //Share location button
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
