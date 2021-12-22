//
//  LocationsView.swift
//  swift-ui-map-app-prototype
//
//  Created by Rick Brown on 22/12/2021.
//

import SwiftUI

struct LocationsView: View {
  @EnvironmentObject private var vm: LocationViewModel
  
  var body: some View {
    List {
      ForEach(vm.locations) {
        Text($0.name)
      }
    }
  }
}

struct LocationsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsView()
  }
}
