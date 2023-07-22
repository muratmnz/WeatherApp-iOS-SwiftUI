//
//  WeatherCell.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 22.07.2023.
//

import SwiftUI

struct WeatherCell: View {
    var logo: String
    var name: String
    var value: String
    
var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
        VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}
struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
