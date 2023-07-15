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
            WelcomeView()
                .environmentObject(locationManager)
        }
        .background(.blue)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
