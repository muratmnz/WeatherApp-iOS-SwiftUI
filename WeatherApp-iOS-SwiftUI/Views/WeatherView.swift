//
//  WeatherView.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 19.07.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 5){
                    //text label about weather name
                    Text(weather.name)
                        .bold().font(.title)
                    //text label about today date.
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }
                Spacer()
                
                VStack{
                    //text label about degree of feels like.
                    HStack{
                        Text(weather.main.feels_like.roundDouble() + "°").font(.system(size:110)).fontWeight(.bold)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                
            }.padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.421, saturation: 0.735, brightness: 0.702))
            .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        //integrated previewWeather json.
        WeatherView(weather: previewWeather)
    }
}
