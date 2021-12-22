//
//  swift_ui_map_app_prototypeApp.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import SwiftUI

@main
struct swift_ui_map_app_prototypeApp: App {
  @StateObject private var locationViewModel: LocationViewModel = LocationViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(locationViewModel)
    }
  }
}
