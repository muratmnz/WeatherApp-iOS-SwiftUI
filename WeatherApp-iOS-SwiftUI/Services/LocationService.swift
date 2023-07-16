//
//  LocationManager.swift
//  WeatherApp-iOS-SwiftUI
//
//  Created by Murat Minaz on 15.07.2023.
//

import Foundation

import CoreLocation

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    //location & isloading state
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location",error)
        isLoading = false
    }
}
