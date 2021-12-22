//
//  Location.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import Foundation
import MapKit

struct Location: Identifiable {
  let name: String
  let cityName: String
  let coordinates: CLLocationCoordinate2D
  let description: String
  let imageNames: Array<String>
  let link: String
  
  var id: String {
    name + cityName + String(coordinates.latitude) + String(coordinates.longitude)
  }
}
