//
//  LocationViewModel.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import Foundation

class LocationViewModel: ObservableObject {
  @Published var locations: Array<Location> = []
  
  init() {
    let locations = LocationsDataService.locations
    self.locations = locations
  }
}
