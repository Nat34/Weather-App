//
//  WeatherView.swift
//  weather
//
//  Created by Nathan Thomas on 4/28/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like
                            .roundDouble() + "°")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height: 300)
                    
                    AsyncImage(url: URL(string: "https://www.clipartmax.com/png/full/193-1934627_chicago-skyline-cityscape-silhouette-chicago-city-skyline-illustration.png")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.701, saturation: 0.907, brightness: 0.442))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
