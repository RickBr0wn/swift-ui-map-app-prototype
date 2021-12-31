//
//  Location.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import Foundation
import MapKit

struct Location: Equatable, Identifiable {
  let name: String
  let cityName: String
  let coordinates: CLLocationCoordinate2D
  let description: String
  let imageNames: Array<String>
  let link: String
  /// Identifiable
  var id: String {
    name + cityName
  }
  /// Equatable
  static func == (lhs: Location, rhs: Location) -> Bool {
    lhs.id == rhs.id
  }
}
