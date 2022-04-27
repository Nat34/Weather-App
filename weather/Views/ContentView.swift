//
//  ContentView.swift
//  weather
//
//  Created by Nathan Thomas on 4/26/22.
//

import SwiftUI

struct ContentView: View {
    
    //initialize location manage
    // StateObject property wrapper so the view manager can be notified anytime a change occurs in LM
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are:\(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
            

        }
        .background(Color(hue: 0.701, saturation: 0.907, brightness: 0.442))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
