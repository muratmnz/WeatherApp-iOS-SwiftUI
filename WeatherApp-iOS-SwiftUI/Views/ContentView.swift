//
//  ContentView.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 13.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationServer()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are : \(location.longitude),\(location.latitude)")
                     } else{
                    if locationManager.isLoading{
                        LoadingView()
                    }else{
                        WelcomeView()
                            .environmentObject(locationManager)
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
