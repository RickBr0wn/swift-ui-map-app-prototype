//
//  LocationsViewModel.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
  @Published var locations: Array<Location> = [] 
  
  @Published var location: Location {
    didSet {
      self.updateMapRegion(location: location)
    }
  }
  
  @Published var region: MKCoordinateRegion = MKCoordinateRegion()
  
  let defaultMapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
  
  @Published var showLocationsList: Bool = false
  
  @Published var sheetLocation: Location? = nil
  
  init() {
    self.locations = LocationsDataService.locations
    self.location = LocationsDataService.locations.first!
    self.updateMapRegion(location: locations.first!)
  }
  
  private func updateMapRegion(location: Location) -> Void {
    withAnimation(.easeInOut) {
      self.region = MKCoordinateRegion(center: location.coordinates, span: defaultMapSpan)
    }
  }
  
  func toggleLocationsList() -> Void {
    withAnimation(.easeInOut) {
      self.showLocationsList = !self.showLocationsList
    }
  }
  
  func showNextLocation(location: Location) {
    withAnimation(.easeInOut) {
      self.location = location
      self.showLocationsList = false
    }
  }
  
  func nextButtonPressed() {
    guard let currentIndex = locations.firstIndex(where: { $0 == location}) else { return }
    
    let nextIndex = currentIndex + 1
    
    guard locations.indices.contains(nextIndex) else {
      guard let firstLocation = locations.first else { return }
      showNextLocation(location: firstLocation)
      return
    }
    
    let nextLocation = locations[nextIndex]
    
    showNextLocation(location: nextLocation)
  }
}
