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
                        VStack(spacing: 20){
                            Image(systemName: "sun.max").font(.system(size:40))
                            //text label about weather type
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Text(weather.main.feels_like.roundDouble() + "°").font(.system(size:100)).fontWeight(.bold).padding()
                    }
                        Spacer()
                            .frame(height: 80)
                        
                        AsyncImage(url: URL(string: "")) {
                            image in image.resizable().aspectRatio(contentMode: .fit).frame(width:350)
                        }placeholder: {
                            ProgressView()
                        }
                         Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                
                HStack{
                    WeatherCell(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "°"))
                    Spacer()
                    WeatherCell(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "°"))
                }
                HStack{
                    WeatherCell(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    Spacer()
                    WeatherCell(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                    
                }
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom,20)
                .foregroundColor(Color(hue: 0.421, saturation: 0.735, brightness: 0.702))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
            }
            
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
